import AVFoundation
import Foundation
import PhotosUI
import UIKit

class VideoCaptureViewController: ViewController<VideoCaptureViewModel> {
    
    // MARK: - Outlets
    
    @IBOutlet weak var videoCaptureView: VideoCaptureView!
    
    // MARK: - Public Properties

    var config = MediaCaptureConfiguration()
    let photoOutput = AVCapturePhotoOutput()
    let videoOutput = AVCaptureMovieFileOutput()
    let previewLayer = AVCaptureVideoPreviewLayer()
    
    // MARK: - Private Properties
    
    private lazy var captureSession = AVCaptureSession()
    private var currentCamera = AVCaptureDevice.default(for: .video)
    private var elapsedTime: TimeInterval = 0.0
    private var maxDuration: TimeInterval = 90.0
    
    private var mediaOptions: [String] {
        return switch config.mediaType {
            case .any:
                    config
                .mediaType
                .asString
                .split(separator: ",")
                .map { String($0) }
            default:
                [config.mediaType.asString]
        }
    }
    
    private var photoLibraryFilter: PHPickerFilter {
        return switch config.mediaType {
            case .any:
                .any(of: [.images, .videos])
            case .images(_):
                .images
            case .video(_):
                .videos
        }
    }
    
    private var isPhotoCapturingAllowed: Bool {
        config.mediaType == .any || config.mediaType == .images()
    }
    
    private var isVideoRecordingAllowed: Bool {
        config.mediaType == .any || config.mediaType == .video()
    }
    
    // MARK: - Lifecycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        checkCameraPermissions()
        requestPhotoLibraryAuthorization()
        addGestures()
        disableFrontCameraVideoMirroring(config.disableFrontCameraMirroring)
        initializeVideoRecordingButtonAnimation()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        videoCaptureView.bgView.layer.insertSublayer(previewLayer, at: 0)
        previewLayer.frame = videoCaptureView.bgView.bounds
        videoCaptureView.setView()
    }

    // MARK: - Action Methods
    
    @IBAction
    func crossButtonTapped(_ sender: UIButton) {
        viewModel.router.pop(animated: false)
    }
    
    @IBAction
    func mediaLibraryButtonTapped(_ sender: UIButton) {
        openMediaPicker()
    }
    
    @IBAction
    func switchCameraButtonTapped(_ sender: UIButton) {
        switchCamera()
    }
    
    @IBAction
    func cameraFlashButtonTapped(_ sender: UIButton) {
        toggleFlash(sender)
    }
    
    @IBAction
    func shutterButtonTapped(_ sender: UIButton) {
        if isPhotoCapturingAllowed {
            capturePhoto()
        } else {
            viewModel.alert = "Only Video Recording Allowed"
        }
    }
    
    // MARK: - Private Methods
    
    private func initializeVideoRecordingButtonAnimation() {
        videoCaptureView.animation = CABasicAnimation(keyPath: "strokeEnd")
        videoCaptureView.animation.delegate = self
    }
    
    private func addGestures() {
        let gesture = UILongPressGestureRecognizer(target: self, action: #selector(handleVideoRecordState(_:)))
        videoCaptureView.shutterButton.addGestureRecognizer(gesture)
    }
    
    @objc
    private func handleVideoRecordState(_ gesture: UILongPressGestureRecognizer) {
        
        if isVideoRecordingAllowed {
            switch gesture.state {
            case .began:
                startRecording()
            case .ended:
                stopRecording()
            default:
                break
            }
        } else {
            viewModel.alert = "Only image capturing allowed"
        }
    }
   
    private func disableFrontCameraVideoMirroring(_ disable: Bool = true) {
        if let connection = previewLayer.connection, connection.isVideoMirroringSupported {
            connection.automaticallyAdjustsVideoMirroring = !disable
            connection.isVideoMirrored = !disable
        }
    }
    
    private func checkCameraPermissions() {
        switch AVCaptureDevice.authorizationStatus(for: .video) {
            case .notDetermined:
                AVCaptureDevice.requestAccess(for: .video) { [weak self] permitted in
                    guard permitted else { return }
                    
                    DispatchQueue.main.async {
                        self?.setupCamera()
                    }
                }
                break
            case .restricted:
                break
            case .denied:
                break
            case .authorized:
                setupCamera()
            default:
                break
        }
    }
    
    private func setupCamera() {
       
        addInputs()
        setupOutputs()
        
        previewLayer.videoGravity = .resizeAspectFill
        previewLayer.session = captureSession
        
        DispatchQueue.global(qos: .background).async {
            self.captureSession.startRunning()
        }
    }
    
    private func startRecording() {
        guard let outputURL = getOutputURL() else {
            return
        }
        
        videoCaptureView.animateCircularProgress(true)
        videoOutput.startRecording(to: outputURL, recordingDelegate: self)
    }
    
    private func stopRecording() {
        videoCaptureView.animateCircularProgress(false)
        videoOutput.stopRecording()
    }
    
    private func switchCamera() {

        if let currentCameraInput = captureSession.inputs.first as? AVCaptureDeviceInput {

            let currentCameraPosition = currentCameraInput.device.position
            
            let newCameraPosition: AVCaptureDevice.Position = (currentCameraPosition == .back) ? .front : .back
            
            let devices = AVCaptureDevice.DiscoverySession(
                deviceTypes: [.builtInWideAngleCamera, .builtInDualCamera],
                mediaType: .video,
                position: newCameraPosition
            ).devices
            
            if let newCamera = devices.first {
                captureSession.beginConfiguration()
                removeAllInputs()
                currentCamera = newCamera
                addInputs()
                captureSession.commitConfiguration()
            }
        }

    }
    
    private func toggleFlash(_ sender: UIButton) {
        guard let videoDevice = currentCamera else {
            return
        }
        
        do {
            try videoDevice.lockForConfiguration()
            
            if videoDevice.hasTorch {
                switch videoDevice.torchMode {
                    case .off:
                        sender.setImage(AssetsImage.flashAuto.image, for: .normal)
                        videoDevice.torchMode = .auto
                    case .auto:
                        sender.setImage(AssetsImage.flashOn.image, for: .normal)
                        videoDevice.torchMode = .on
                    case .on:
                        sender.setImage(AssetsImage.flashOff.image, for: .normal)
                        videoDevice.torchMode = .off
                    @unknown default:
                        break
                }
            }
                        
            videoDevice.unlockForConfiguration()
        } catch {
            print("Error locking device for configuration: \(error.localizedDescription)")
        }
    }
    
    private func openMediaPicker() {
        var configuration = PHPickerConfiguration()
        configuration.filter = photoLibraryFilter
        configuration.selectionLimit = config.libraryMediaSelectionLimit
        
        let mediaPicker = PHPickerViewController(configuration: configuration)
        
        mediaPicker.delegate = self
        
        present(mediaPicker, animated: true)
    }

    private func capturePhoto() {
        let photoSettings = AVCapturePhotoSettings(format: [AVVideoCodecKey: AVVideoCodecType.jpeg])
        photoOutput.capturePhoto(with: photoSettings, delegate: self)
    }
    
    private func getOutputURL() -> URL? {
        let fileManager = FileManager.default
        let documentsPath = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first
        let videoOutputURL = documentsPath?.appendingPathComponent("output.mp4")
        return videoOutputURL
    }
    
    private func setupOutputs() {
        
        if isPhotoCapturingAllowed && captureSession.canAddOutput(photoOutput) {
            captureSession.addOutput(photoOutput)
        }
            
        if isVideoRecordingAllowed && captureSession.canAddOutput(videoOutput) {
            captureSession.addOutput(videoOutput)
        }
    }
    
    private func removeAllInputs() {
        for input in captureSession.inputs {
            captureSession.removeInput(input)
        }
    }
    
    private func addInputs() {
        do {
            
            if let camera = currentCamera {
                let videoInput = try AVCaptureDeviceInput(device: camera)
                if captureSession.canAddInput(videoInput) {
                    captureSession.addInput(videoInput)
                }
            }
            
            if isVideoRecordingAllowed {
                if let audioDevice = AVCaptureDevice.default(for: .audio) {
                    let audioDeviceInput = try AVCaptureDeviceInput(device: audioDevice)
                    
                    if captureSession.canAddInput(audioDeviceInput) {
                        captureSession.addInput(audioDeviceInput)
                    }
                }
            }
    
        }
        catch {
            print(error)
        }
    }
    
    private func requestPhotoLibraryAuthorization() {
     
    }
    
    func replaceMovWithMp4(inputURL: URL, completion: @escaping (URL?, Error?) -> Void) {
        var outputURL = inputURL.deletingPathExtension()
        outputURL = outputURL.appendingPathExtension("mp4")

        do {
            try FileManager.default.moveItem(at: inputURL, to: outputURL)
            completion(outputURL, nil)
        } catch {
            completion(nil, error)
        }
    }
}

extension VideoCaptureViewController: AVCaptureFileOutputRecordingDelegate {
    
    func fileOutput(_ output: AVCaptureFileOutput, didFinishRecordingTo outputFileURL: URL, from connections: [AVCaptureConnection], error: Error?) {
       
        viewModel.createdMedia = .video(fileURL: outputFileURL)
        viewModel.confirmSelectedMedia()
    }
    
}

extension VideoCaptureViewController: AVCapturePhotoCaptureDelegate {
    
    func photoOutput(_ output: AVCapturePhotoOutput, didFinishProcessingPhoto photo: AVCapturePhoto, error: Error?) {
        guard let imageData = photo.fileDataRepresentation() else {
            print("Error converting photo to data.")
            return
        }
       
        viewModel.createdMedia = .images(data: [imageData])
        viewModel.confirmSelectedMedia()
    }
    
}

extension VideoCaptureViewController: PHPickerViewControllerDelegate {
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        
        picker.dismiss(animated: true)
        
        var processedImagesCount = 0
        
        if !results.isEmpty {
            ProgressLoaderManager.shared.show(for: view)
        }
        
        for result in results {
            if result.itemProvider.canLoadObject(ofClass: UIImage.self) {
                result.itemProvider.loadDataRepresentation(forTypeIdentifier: UTType.image.identifier, completionHandler: { data, error in
                    guard let data = data else { return }
                    self.viewModel.imagesData.append(data)
                    processedImagesCount += 1
                    
                    if processedImagesCount == results.count {
                        DispatchQueue.main.async {
                            ProgressLoaderManager.shared.hide(for: self.view)
                            self.viewModel.createdMedia = .images(data: self.viewModel.imagesData)
                            self.viewModel.performConfirmation()
                        }
                    }
                })
            } else if result.itemProvider.hasItemConformingToTypeIdentifier(UTType.movie.identifier)  {
                result.itemProvider.loadFileRepresentation(forTypeIdentifier: UTType.movie.identifier) { (url, error) in
                    if let error = error {
                        print("Error loading video: \(error.localizedDescription)")
                        return
                    }
                    
                    if let videoURL = url {
                        let fileName = "\(Int(Date().timeIntervalSince1970)).\(videoURL.pathExtension)"
                        let newURL = URL(fileURLWithPath: NSTemporaryDirectory() + fileName)
                        try? FileManager.default.copyItem(at: videoURL, to: newURL)
                        DispatchQueue.main.async {
                            ProgressLoaderManager.shared.hide(for: self.view)
                            self.viewModel.createdMedia = .video(fileURL: newURL)
                            self.viewModel.performConfirmation()
                        }
                    }
                }
            } else {
            
                ProgressLoaderManager.shared.hide(for: self.view)
            }
        }
    }
 
}

extension VideoCaptureViewController: CAAnimationDelegate {
    func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        if flag {
            stopRecording()
        }
    }
}

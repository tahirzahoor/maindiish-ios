import AVKit
import AVFoundation
import Foundation
//import MobileCoreServices
import PhotosUI
import Photos
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
    private var mediaPicker: UIImagePickerController?
    
    private var mediaOptions: [String] {
        if config.mediaType == .any {
            return MediaCaptureConfiguration
                .MediaType
                .any
                .rawValue
                .split(separator: ",")
                .map { String($0) }
        } else {
            return [config.mediaType.rawValue]
        }
    }
    
    private var isPhotoCapturingAllowed: Bool {
        config.mediaType == .any || config.mediaType == .image
    }
    
    private var isVideoRecordingAllowed: Bool {
        config.mediaType == .any || config.mediaType == .video
    }
        
    // MARK: - Lifecycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        checkCameraPermissions()
        addGestures()
        initMediaPicker()
        disableFrontCameraVideoMirroring(config.disableFrontCameraMirroring)
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
    func videoLibraryButtonTapped(_ sender: UIButton) {
        if let picker = mediaPicker {
            present(picker, animated: true)
        }
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
    
    private func addGestures() {
        let gesture = UILongPressGestureRecognizer(target: self, action: #selector(handleVideoRecordState(_:)))
        videoCaptureView.shutterButton.addGestureRecognizer(gesture)
    }
    
    @objc
    private func handleVideoRecordState(_ gesture: UILongPressGestureRecognizer) {
        
        if isVideoRecordingAllowed {
            videoCaptureView.updateButtonView(for: gesture.state)
            
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
    
    @objc
    private func dismissView() {
        dismiss(animated: true)
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
    
    func startRecording() {
        guard let outputURL = getOutputURL() else {
            return
        }
       
        videoOutput.startRecording(to: outputURL, recordingDelegate: self)
        
    }
    
    func stopRecording() {
        videoOutput.stopRecording()
    }
    
    func playRecordedVideo(outputFileURL: URL) {
        
        let controller = AVPlayerViewController()
       
        let player = AVPlayer(url: outputFileURL)
        controller.player = player
       
        present(controller, animated: true)
    }
    
    func switchCamera() {

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
    
    func toggleFlash(_ sender: UIButton) {
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
    
    private func initMediaPicker() {
        let videoPicker = UIImagePickerController()
        videoPicker.sourceType = .photoLibrary
        videoPicker.mediaTypes = mediaOptions
        videoPicker.delegate = self
        
        self.mediaPicker = videoPicker
    }

    func capturePhoto() {
        let photoSettings = AVCapturePhotoSettings(format: [AVVideoCodecKey: AVVideoCodecType.jpeg])
        photoOutput.capturePhoto(with: photoSettings, delegate: self)
    }
    
    func getOutputURL() -> URL? {
        let fileManager = FileManager.default
        let documentsPath = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first
        let videoOutputURL = documentsPath?.appendingPathComponent("output.mp4")
        return videoOutputURL
    }
    
    func setupOutputs() {
        
        if isPhotoCapturingAllowed && captureSession.canAddOutput(photoOutput) {
            captureSession.addOutput(photoOutput)
        }
            
        if isVideoRecordingAllowed && captureSession.canAddOutput(videoOutput) {
            captureSession.addOutput(videoOutput)
        }
    }
}

extension VideoCaptureViewController: AVCaptureFileOutputRecordingDelegate {
    
    func fileOutput(_ output: AVCaptureFileOutput, didFinishRecordingTo outputFileURL: URL, from connections: [AVCaptureConnection], error: Error?) {
        let controller = Route.confirmMediaCaptured(.video, imageData: nil, videoFileURL: outputFileURL).controller()
        
        present(controller, animated: false)
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
   
}

extension VideoCaptureViewController: AVCapturePhotoCaptureDelegate {
    
    func photoOutput(_ output: AVCapturePhotoOutput, didFinishProcessingPhoto photo: AVCapturePhoto, error: Error?) {
        guard let imageData = photo.fileDataRepresentation() else {
            print("Error converting photo to data.")
            return
        }
        
        let controller = Route.confirmMediaCaptured(.image, imageData: imageData, videoFileURL: nil).controller()
        
        present(controller, animated: false)
    }
    
}

extension VideoCaptureViewController: UIImagePickerControllerDelegate & UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let selectedImage = info[.originalImage] as? UIImage {
            if let imageData = selectedImage.jpegData(compressionQuality: 1.0) {
                viewModel.selectedImagesData.append(imageData)
            }
        }
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true)
    }
    
}

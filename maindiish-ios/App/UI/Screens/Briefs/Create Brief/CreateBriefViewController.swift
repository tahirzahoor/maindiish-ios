//
//  CreateBriefViewController.swift
//  maindiish-ios
//
//  Created by Faizan Tanveer on 14/11/2023.
//

import AVKit
import Foundation
import UIKit

class CreateBriefViewController: ViewController<CreateBriefViewModel> {
    
    // MARK: - Outlets
    
    @IBOutlet weak var createBriefView: CreateBriefView!
    
    // MARK: - Private Properties
    private var videoPlayer: AVPlayerViewController?
    private var imageView: UIImageView?
    
    // MARK: - Lifecycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setMediaView()
    }
    
    // MARK: - Action Methods
    
    @IBAction
    func backButtonTapped(_ sender: UIButton) {
        viewModel.router.pop(animated: false)
    }
    
    @IBAction
    func removeMediaButtonTapped(_ sender: UIButton) {
        removeMediaView()
    }
    
    @IBAction
    func uploadMediaButtonTapped(_ sender: UIButton) {
        var configuration = MediaCaptureConfiguration()
        configuration.mediaType = .any
        configuration.libraryMediaSelectionLimit = 1
        viewModel.router.append(.captureVideo(configuration, confirmationDelegate: self), animated: false)
    }
    
    @IBAction
    func reviewButtonTapped(_ sender: RoundedButton) {
        viewModel.validate()
    }
    
    // MARK: - Private Methods
    
    private func removeMediaView() {
        switch viewModel.briefData.mediaType {
            case .images(_):
                imageView?.removeFromSuperview()
                imageView = nil
            case .video(_):
                videoPlayer?.view.removeFromSuperview()
                videoPlayer = nil
            default:
                break
        }
        viewModel.briefData.mediaType = nil
        updateMediaView()
    }
    
    private func setMediaView() {
        switch viewModel.briefData.mediaType {
            case .images(let imagesData):
            guard let data = imagesData, !data.isEmpty else { return }
                embedImageView(imageData: data[0])
            case .video(let url):
                embedVideoPlayer(fileURL: url)
            default:
                break
        }
        updateMediaView()
    }
    
    private func embedImageView(imageData: Data?) {
        guard let data = imageData else { return }
        
        let image = UIImage(data: data)
        imageView = UIImageView(image: image)
        imageView?.fixInView(createBriefView.innerMediaView)
    }
    
    private func embedVideoPlayer(fileURL: URL?) {
        guard let url = fileURL else {
            return
        }
        
        if let data = try? Data(contentsOf: url) {
            print(data)
        }
        let player = AVPlayer(url: url)
        
        videoPlayer = AVPlayerViewController()
        videoPlayer?.player = player
        videoPlayer?.showsPlaybackControls = false
        
        videoPlayer?.view.fixInView(createBriefView.innerMediaView)
        
        player.play()
    }
    
    private func updateMediaView() {
        createBriefView.videoIndicatorImageView.isHidden = viewModel.briefData.mediaType != .video()
        createBriefView.uploadMediaButton.isHidden = viewModel.briefData.mediaType != nil
        createBriefView.removeMediaButton.isHidden = viewModel.briefData.mediaType == nil
    }
}

// MARK: - UITextViewDelegate
extension CreateBriefViewController: UITextViewDelegate {
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        
        let textViewText = textView.text as? NSString ?? ""
        
        var updatedText = textViewText.replacingCharacters(in: range, with: text)
        
        switch textView.tag {
            case CreateBriefTextViewTag.description.rawValue:
                guard updatedText.count <= 2000 else {
                    return false
                }
                
                viewModel.briefData.description = updatedText
                textView.text = updatedText
                
            case CreateBriefTextViewTag.tags.rawValue:
                if (text == "#" && textView.text.last != " ")
                    || ((textView.text.last == "#" || textView.text.last == " ") && text == " ") {
                    return false
                }
                if text.isEmpty && range.length > 0 {
                    if textView.text.count > 2 && textView.text.last == "#" {
                        textView.text.removeLast(2)
                        updatedText = textView.text
                    }
                } else if updatedText.last == " " {
                    updatedText.append("#")
                }
                
                let finalText = updatedText.isEmpty ? "#" : updatedText
                textView.text = finalText
                viewModel.briefData.tags = finalText
                
            default:
                break
        }
        
        return false
    }
   
}

extension CreateBriefViewController: ConfirmMediaDelegate {
    func didConfirmSelectedMedia(type: MediaCaptureConfiguration.MediaType) {
        viewModel.briefData.mediaType = type
        setMediaView()
    }
}


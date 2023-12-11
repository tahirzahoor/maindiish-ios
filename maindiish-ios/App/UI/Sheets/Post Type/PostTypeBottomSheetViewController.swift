//
//  PostTypeBottomSheetViewController.swift
//  maindiish-ios
//
//  Created by Faizan Tanveer on 11/11/2023.
//
import AVKit
import AVFoundation
import Foundation
import MobileCoreServices
import UIKit

class PostTypeBottomSheetViewController: ViewController<PostTypeBottomSheetViewModel> {
    
    // MARK: - Outlets
    
    @IBOutlet weak var sheetView: PostTypeBottomSheetView!
    
    // MARK: - Lifecycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addDragDownGesture(to: sheetView.optionsBackgroundView)
    }
    
    // MARK: - Action Methods
    
    @IBAction
    func videoOptionButtonTapped(_ sender: RoundedButton) {
        guard let presenter = viewModel.router.topMostController() as? ConfirmMediaDelegate else { return }
        dismiss(animated: false) {
            var configuration = MediaCaptureConfiguration()
            configuration.mediaType = .any
            configuration.libraryMediaSelectionLimit = 1
            self.viewModel.router.append(.captureVideo(configuration, confirmationDelegate: presenter), animated: false)
        }
    }
    
    @IBAction
    func blogOptionButtonTapped(_ sender: RoundedButton) {
        dismiss(animated: false) {
            self.viewModel.router.append(.createBlog, animated: false)
        }
    }
    
}

extension PostTypeBottomSheetViewController: UIImagePickerControllerDelegate & UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let videoURL = info[.mediaURL] as? URL {
            let player = AVPlayer(url: videoURL)
            let playerViewController = AVPlayerViewController()
            playerViewController.player = player
            
            picker.dismiss(animated: true) {
                self.present(playerViewController, animated: true) {
                    player.play()
                }
            }
        }

        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true)
    }
}

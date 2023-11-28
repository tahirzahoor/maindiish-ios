//
//  EditProfileViewController.swift
//  maindiish-ios
//
//  Created by Faizan Tanveer on 28/11/2023.
//

import Foundation
import UIKit

class EditProfileViewController: ViewController<EditProfileViewModel> {
    
    // MARK: - Outlets
    
    @IBOutlet weak var editProfileView: EditProfileView!
    
    // MARK: - Action Methods
    
    @IBAction
    func cameraIconTapped(_ sender: UIButton) {
        
        var configuration = MediaCaptureConfiguration()
        configuration.libraryMediaSelectionLimit = 1
        configuration.mediaType = .images()
        
        viewModel.router.append(
            .captureVideo(
                configuration,
                confirmationDelegate: self
            ),
            animated: true
        )
    }
    
    @IBAction
    func backButtonTapped(_ sender: UIButton) {
        viewModel.router.pop(animated: true)
    }
}

// MARK: - ConfirmMediaCaptureDelegate Methods

extension EditProfileViewController: ConfirmMediaDelegate {
    func didConfirmSelectedMedia(type: MediaCaptureConfiguration.MediaType) {
        switch type {
            case .images(let data):
            
                guard let data = data, let first = data.first else { return }
                editProfileView.profileImageView.image = UIImage(data: first)
            
            default:
                break
        }
    }
}


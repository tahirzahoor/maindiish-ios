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
    
    // MARK: - Lifecycle Methods
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    // MARK: - Action Methods
    
    @IBAction
    func nameTextFieldEditingDidChange(_ sender: UITextField) {
        
        guard var text = sender.text else { return }
        
        text = text.replacingOccurrences(
            of: " +",
            with: " ",
            options: .regularExpression,
            range: nil
        )
        
        let name = String(text.prefix(40))
        
        sender.text = name
        
        UserDefaultsManager.shared.name = name
    }
    
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
                
                guard let data = data, let firstData = data.first else { return }
                UserDefaultsManager.shared.profileImageData = firstData
                editProfileView.profileImageView.image = UIImage(data: firstData)
                
            default:
                break
        }
    }
}

// MARK: - UITextViewDelegate Methods

extension EditProfileViewController: UITextViewDelegate {
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        UserDefaultsManager.shared.bio = textView.text + text
        return true
    }
    
}

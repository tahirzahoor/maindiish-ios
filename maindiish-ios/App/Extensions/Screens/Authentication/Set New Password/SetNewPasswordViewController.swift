//
//  SetNewPasswordViewController.swift
//  maindiish-ios
//
//  Created by Faizan Tanveer on 29/10/2023.
//

import Foundation
import UIKit

class SetNewPasswordViewController: ViewController<SetNewPasswordViewModel> {
    
    // MARK: - Outlets
    
    @IBOutlet weak var setNewPasswordView: SetNewPasswordView!
    
    // MARK: - Lifecycle Methods
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    // MARK: - Action Methods
    
    @IBAction
    func visibilityButtonTapped(_ sender: UIButton) {
        
        sender.isSelected.toggle()
    
        let image = sender.isSelected ? AssetsImage.eyesOff.image : AssetsImage.eyesOn.image
        
        sender.setImage(image, for: .normal)
        
        setNewPasswordView.inputFields[sender.tag].isSecureTextEntry.toggle()
        
    }
    
    @IBAction
    func textfieldEditingChanged(_ sender: UITextField) {
        
        if sender.tag == 0 {
            viewModel.newPassword = setNewPasswordView.inputFields[0].text ?? ""
        } else {
            viewModel.reEnteredPassword = setNewPasswordView.inputFields[1].text ?? ""
        }

    }
    
    @IBAction
    func saveButtonTapped(_ sender: RoundedButton) {
        viewModel.validate()
    }
    
}

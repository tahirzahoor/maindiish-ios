//
//  SignUpViewController.swift
//  BaseCode
//
//  Created by Faizan Tanveer on 22/10/2023.
//

import Foundation
import UIKit

class SignUpViewController: ViewController<SignUpViewModel> {
    
    // MARK: - Private Properties
    
    private let numberOfNonPasswordFields = 3
    
    // MARK: - Outlets
    
    @IBOutlet weak var signUpView: SignUpView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        includeHeader(
            GlobalStrings.Title.signUp,
            delegate: self,
            fixIn: signUpView.headerView
        )
    }
    
    // MARK: - Action Methods
    
    @IBAction
    func numberCountrySelectorDropDownButtonTapped(_ sender: UIButton) {
    }
    
    @IBAction
    func passwordVisibilityButtonTapped(_ sender: UIButton) {
        
        let index = sender.tag - numberOfNonPasswordFields
        signUpView.passwordFields[index].isSecureTextEntry.toggle()
        
        let isHidden = signUpView.passwordFields[index].isSecureTextEntry
        
        let image = isHidden ? AssetsImage.eyesOn.image : AssetsImage.eyesOff.image
        sender.setImage(image, for: .normal)
    }
    
    @IBAction
    func agreementConfirmationButtonTapped(_ sender: UIButton) {
        sender.isSelected.toggle()
        
        let isSelected = sender.isSelected
        
        let image = isSelected ? AssetsImage.checked.image : AssetsImage.unchecked.image
        sender.setImage(image, for: .normal)
    }
    
    @IBAction
    func policiesAndTermsButtonTapped(_ sender: UIButton) {
    }
    
    @IBAction
    func nextButtonTapped(_ sender: RoundedButton) {
        viewModel.router.append(.createUsername, animated: true)
    }
    
    @IBAction
    func needHelpButtonTapped(_ sender: UIButton) {
        
    }
    
    @IBAction
    func loginButtonTapped(_ sender: UIButton) {
        viewModel.router.pop(animated: false)
        viewModel.router.append(.login, animated: false)
    }
    
}

extension SignUpViewController: AuthenticationScreenHeaderViewDelegate {
    func didTapBackButton() {
        viewModel.router.pop(animated: true)
    }
}

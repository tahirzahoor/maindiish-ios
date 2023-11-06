//
//  SignUpViewController.swift
//  BaseCode
//
//  Created by Faizan Tanveer on 22/10/2023.
//

import Combine
import Foundation
import UIKit

class SignUpViewController: ViewController<SignUpViewModel> {
    
    // MARK: - Private Properties
    
    private let numberOfNonSecureFields = 3
    
    // MARK: - Outlets
    
    @IBOutlet weak var signUpView: SignUpView!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
        title = "Sign Up"
    }
    
    // MARK: - Action Methods
    
    @IBAction
    func numberCountrySelectorDropDownButtonTapped(_ sender: UIButton) {
        let options = viewModel.countryCodes.map {
            "\($0.countryCode)(\($0.dialCode))"
        }
        let selectedOptionIndex = options.firstIndex(where: { $0.contains(signUpView.selectedCountryLabel.text ?? "") }) ?? 0
        viewModel.router.showSheet(
            .bottomUp(options, selectedOptionIndex: selectedOptionIndex, delegate: self),
            animated: true
        )
    }
    
    @IBAction
    func passwordVisibilityButtonTapped(_ sender: UIButton) {
        
        let index = sender.tag - numberOfNonSecureFields
        
        let isHidden = signUpView.passwordFields[index].isSecureTextEntry
        
        let image = isHidden ? AssetsImage.eyesOn.image : AssetsImage.eyesOff.image
        sender.setImage(image, for: .normal)
        
        signUpView.passwordFields[index].isSecureTextEntry.toggle()
    }
    
    @IBAction
    func agreementConfirmationButtonTapped(_ sender: UIButton) {
        sender.isSelected.toggle()
        
        let isSelected = sender.isSelected
        
        let image = isSelected ? AssetsImage.checked.image : AssetsImage.unchecked.image
        sender.setImage(image, for: .normal)
        
        viewModel.signUpData.agreedToTerms = isSelected
    }
    
    @IBAction
    func policiesAndTermsButtonTapped(_ sender: UIButton) {
        // MARK: - API Required
    }
    
    @IBAction
    func nextButtonTapped(_ sender: RoundedButton) {
        viewModel.validateData()
    }
    
    @IBAction
    func needHelpButtonTapped(_ sender: UIButton) {
        // MARK: - API Required
    }
    
    @IBAction
    func loginButtonTapped(_ sender: UIButton) {
        viewModel.router.pop(animated: false)
        viewModel.router.append(.login, animated: false)
    }
    
    @objc
    private func backButtonTapped() {
        viewModel.router.pop(animated: true)
    }
    
}

// MARK: - UITextFieldDelegate Methods

extension SignUpViewController: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        guard let text = textField.text?.trimmingCharacters(in: .whitespacesAndNewlines) as? NSString else {
            return false
        }
        
        let textAfterUpdate = text.replacingCharacters(in: range, with: string)
        
        let field = SignUpField.allCases[textField.tag]
        
        viewModel.signUpData[field] = textAfterUpdate
        
        return true
    }
            
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if let nextField = view.viewWithTag(textField.tag + 1) as? UITextField {
            nextField.becomeFirstResponder()
        } else {
            textField.resignFirstResponder()
        }
        
        return true
    }
    
}

// MARK: - BottomUpOptionsSheetDelegate Methods

extension SignUpViewController: BottomUpOptionsDelegate {
    func didSelectOption(_ option: String, at index: Int) {
        signUpView.selectedCountryLabel.text = viewModel.countryCodes[index].countryCode
    }
}




//
//  ForgotPasswordViewController.swift
//  maindiish-ios
//
//  Created by Faizan Tanveer on 29/10/2023.
//

import Foundation
import UIKit

class ForgotPasswordViewController: ViewController<ForgotPasswordViewModel> {
    
    // MARK: - private properties
    
    private var viewIsToggled = false
    
    // MARK: - Outlets
    
    @IBOutlet weak var forgotPasswordView: ForgotPasswordView!
    
    // MARK: - Lifecycle Methods
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        title = "Forgot Password"
        navigationController?.setNavigationBarHidden(false, animated: false)
    }

    // MARK: - Action Methods
    
    @IBAction
    func countryDialCodeSelectionButtonTapped(_ sender: UIButton) {
        let options = viewModel.countryCodes.map {
            "\($0.countryCode) (\($0.dialCode))"
        }
        viewModel.router.showSheet(.bottomUp(options, delegate: self), animated: true)
    }
    
    @IBAction
    func resetPasswordButtonTapped(_ sender: RoundedButton) {
        guard !isEmptyField() else {
            viewModel.alert = GlobalStrings.Message.fillInRequiredFields
            return
        }
        
        let nextRoute: Route = viewIsToggled ? .typeCode : .openEmail
        viewModel.router.append(nextRoute, animated: true)
    }
    
    @IBAction
    func resetUsingPhoneButtonTapped(_ sender: UIButton) {
        
        viewIsToggled.toggle()
        
        let buttonTitle = viewIsToggled ? GlobalStrings.Title.resetThroughEmail : GlobalStrings.Title.resetThroughPhone
        
        sender.setTitle(buttonTitle, for: .normal)
        
        let viewType: PasswordResetOption = viewIsToggled ? .phone : .email
        
        forgotPasswordView.setView(for: viewType)
    }
    
    // MARK: - Private Methods
    
    private func isEmptyField() -> Bool {
        if viewIsToggled {
            return forgotPasswordView.phoneNumberField.text?.isEmpty ?? true
        } else {
            return forgotPasswordView.emailField.text?.isEmpty ?? true
        }
    }
    
}

// MARK: - BottomUpOptionsSheetDelegate Methods

extension ForgotPasswordViewController: BottomUpOptionsDelegate {
    func didSelectOption(_ option: String, at index: Int) {
        let selectedDialCode = viewModel.countryCodes[index].dialCode
        forgotPasswordView.countryDialCodeSelectionButton.setTitle(selectedDialCode, for: .normal)
    }
}

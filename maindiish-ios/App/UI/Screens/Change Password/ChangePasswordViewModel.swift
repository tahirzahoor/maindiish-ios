//
//  ChangePasswordViewModel.swift
//  maindiish-ios
//
//  Created by Faizan Tanveer on 29/11/2023.
//

import Foundation

class ChangePasswordViewModel: ViewModel {
    
    // MARK: - Private Properties
    
    private var currentPassword = ""
    private var newPassword = ""
    private var confirmNewPassword = ""
    
    private var fieldIsEmpty: Bool {
        currentPassword.isEmpty 
        || newPassword.isEmpty
        || confirmNewPassword.isEmpty
    }
    
    private var arePasswordsMatching: Bool {
        newPassword == confirmNewPassword
    }
    
    // MARK: - Public Properties
    
    @Published var inputsAreValid = false
    
    // MARK: - Private Methods
    
    private func isValidCurrentPassword() -> Bool {
        currentPassword == "password"
    }
    
    // MARK: - Public Methods
    
    func update(valueFor field: ChangePasswordField, withText text: String) {
        
        switch field {
            case .currentPassword:
                currentPassword = text
            case .newPassword:
                newPassword = text
            case .confirmNewPassword:
                confirmNewPassword = text
        }
    }
    
    func verifyInputs() {
        if fieldIsEmpty {
            alert = "Empty field(s)"
        } else if !isValidCurrentPassword() {
            alert = "Invalid current password"
        } else if !arePasswordsMatching {
            alert = "Confirmation Password does not match"
        } else {
            inputsAreValid = true
        }
    }
}

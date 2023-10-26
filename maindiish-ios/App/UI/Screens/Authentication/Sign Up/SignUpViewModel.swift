//
//  SignUpViewModel.swift
//  BaseCode
//
//  Created by Faizan Tanveer on 22/10/2023.
//

import Foundation

fileprivate typealias validationMessage = (title: String, Message: String)

class SignUpViewModel: ViewModel {
   
    var signUpData = SignUpDataModel()
    
    func validateData() {
        
        guard let message = invalidDataMessage() else {
            router.append(.createUsername(viewModel: self), animated: true)
            return
        }
        
        let alertVM = AlertViewModel(title: message.0, message: message.1)
        router.showSheet(.okAlert(alertVM), animated: true)
    }
    
    private func invalidDataMessage() -> validationMessage? {
        var message: validationMessage? = nil
        
        if fieldIsEmpty() {
            message = validationMessage(
                GlobalStrings.Title.emptyField,
                GlobalStrings.Message.fillInRequiredFields
            )
        } else if isInvalidEmail() {
            message = validationMessage(
                GlobalStrings.Title.invalidEmail,
                GlobalStrings.Message.enterValidEmail
            )
        } else if isInvalidPassword() {
            message = validationMessage(
                GlobalStrings.Title.invalidPassword,
                GlobalStrings.Message.passwordMustContain
            )
        } else if passwordsDonotMatch() {
            message = validationMessage(GlobalStrings.Title.mismatchedPasswords, GlobalStrings.Message.passwordsMustBeSame)
        } else if notAgreedToTerms() {
            message = validationMessage(GlobalStrings.Title.termsNotAgreed, GlobalStrings.Message.agreeToTerms)
        }
        
        return message
    }
   
    private func fieldIsEmpty() -> Bool {
        return signUpData.name.isEmpty ||
               signUpData.email.isEmpty ||
               signUpData.number.number.isEmpty ||
               signUpData.password.isEmpty ||
               signUpData.confirmPassword.isEmpty
    }
    
    private func isInvalidEmail() -> Bool {
        return !signUpData.email.isValidEmail
    }
    
    private func passwordsDonotMatch() -> Bool {
        return signUpData.password != signUpData.confirmPassword
    }
    
    private func notAgreedToTerms() -> Bool {
        return !signUpData.agreedToTerms
    }
    
    private func isInvalidPassword() -> Bool {
        return !signUpData.password.isValidPassword
    }
    
}

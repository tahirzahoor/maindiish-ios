//
//  LoginViewModel.swift
//  BaseCode
//
//  Created by Faizan Tanveer on 20/10/2023.
//

import Foundation

class LoginViewModel: ViewModel {
    
    // MARK: - Public Properties
    
    var email = ""
    var password = ""
    
    // MARK: - Public Methods
    
    func validate() {
        
        if fieldIsEmpty() {
            alert = GlobalStrings.Message.fillInRequiredFields
        } else if isNotValidEmail() {
            alert = GlobalStrings.Message.enterValidEmail
        }
        
        // MARK: - API Call (will be implemented later)
    }
    
    // MARK: - Private Methods
    
    private func isNotValidEmail() -> Bool {
        return !email.isValidEmail
    }
    
    private func fieldIsEmpty() -> Bool {
        return email.isEmpty || password.isEmpty
    }
}

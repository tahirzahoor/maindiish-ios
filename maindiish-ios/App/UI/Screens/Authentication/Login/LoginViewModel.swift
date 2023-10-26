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
        guard isValidEmail() else {
            alert = GlobalStrings.Message.enterValidEmail
            return
        }
        
        // MARK: - API Call (will be implemented later)
    }
    
    // MARK: - Private Methods
    
    private func isValidEmail() -> Bool {
        return email.isValidEmail
    }
}

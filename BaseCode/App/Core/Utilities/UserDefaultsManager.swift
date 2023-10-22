//
//  UserDefaultsManager.swift
//  BaseCode
//
//  Created by Faizan Tanveer on 20/10/2023.
//

import Foundation

class UserDefaultsManager {
    
    // MARK: - Static Properties
    
    static let shared = UserDefaultsManager()
    
    // MARK: - Stored Key-Value pairs
    
    @Storage(
        wrappedValue: true,
        GlobalStrings.UserDefaultKey.getStarted
    ) var isOnboarding: Bool
    
    @Storage(
        wrappedValue: false,
        GlobalStrings.UserDefaultKey.isLoggedIn
    ) var isLoggedIn: Bool
   
    
    // MARK: - Instance Methods
    
    private init() { }
}

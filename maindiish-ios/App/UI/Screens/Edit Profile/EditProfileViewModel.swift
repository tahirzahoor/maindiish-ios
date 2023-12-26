//
//  EditProfileViewModel.swift
//  maindiish-ios
//
//  Created by Faizan Tanveer on 28/11/2023.
//

import Foundation

class EditProfileViewModel: ViewModel {
    
    // MARK: - Public Properties
    
    var name = UserDefaultsManager.shared.name
    var email = UserDefaultsManager.shared.email
    var bio = UserDefaultsManager.shared.bio
    
    // MARK: - Public Methods
    
    func goBack(afterSaving: Bool = false) {
        if afterSaving {
            UserDefaultsManager.shared.name = name
            UserDefaultsManager.shared.bio = bio
        }
        router.pop(animated: true)
    }
    
}

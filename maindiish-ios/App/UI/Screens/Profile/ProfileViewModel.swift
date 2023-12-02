//
//  ProfileViewModel.swift
//  maindiish-ios
//
//  Created by Faizan Tanveer on 20/11/2023.
//

import Foundation

class ProfileViewModel: ViewModel {
    
    var user = User()
    var tab = TabItem.all
    var id = "."
    
    init(id: String) {
        self.id = id
    }
    
}

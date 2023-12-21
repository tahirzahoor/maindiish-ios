//
//  ChatViewModel.swift
//  maindiish-ios
//
//  Created by Faizan Tanveer on 05/12/2023.
//

import Foundation

class ChatViewModel: ViewModel {
    
    // MARK: - Public Properties
    
    var user: User
    var cellData = MessagesRepository.shared.sections
    
    // MARK: - Initializers
    
    init(user: User) {
        self.user = user
    }
}

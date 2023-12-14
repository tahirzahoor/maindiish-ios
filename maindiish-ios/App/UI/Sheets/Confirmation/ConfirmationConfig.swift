//
//  ConfirmationConfig.swift
//  maindiish-ios
//
//  Created by Faizan Tanveer on 14/12/2023.
//

import Foundation

enum ConfirmationConfig {
    case unfollowOrBlock(userID: String, userName: String = "")
    
    var viewConfig: ConfirmationViewConfiguration {
        switch self {
        case .unfollowOrBlock(_, let name):
                let viewTitle = "Block \(name) or Unfollow"
                let button1Title = "Block"
                let button2Title = "Unfollow"
                let action1: () -> Void = {
                    
                }
                let action2: () -> Void = {
                    
                }
                
                let config = ConfirmationViewConfiguration(
                    title: viewTitle,
                    button1Title: button1Title,
                    button2Title: button2Title,
                    button1Action: action1,
                    button2Action: action2
                )
            
                return config
        }
    }
}

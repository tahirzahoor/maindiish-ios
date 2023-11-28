//
//  SettingsViewModel.swift
//  maindiish-ios
//
//  Created by Faizan Tanveer on 28/11/2023.
//

import Foundation

class SettingsViewModel: ViewModel {
    
    // MARK: - Public Properties
    
    var sections: [SettingsSection] {
        SettingsSection.allCases
    }
    
    // MARK: - Public Methods
    
    func performAction(forRowAt indexPath: IndexPath) {
        let row = sections[indexPath.section].rows[indexPath.row]
        
        switch row {
            case .routable(_, let route):
                router.append(route, animated: true)
            case .tappable(let title):
                if title == "Log out" {
                    // MARK: - API Required
                }
            default:
                break
        }
        
    }
}

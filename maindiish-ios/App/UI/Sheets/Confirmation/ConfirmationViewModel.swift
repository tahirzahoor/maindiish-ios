//
//  ConfirmationViewModel.swift
//  maindiish-ios
//
//  Created by Faizan Tanveer on 14/12/2023.
//

import Foundation

class ConfirmationViewModel: ViewModel {
    
    // MARK: - Public Properties
    
    var config: ConfirmationConfig
    
    // MARK: - Public Methods
    
    init(config: ConfirmationConfig) {
        self.config = config
    }
    
    // MARK: - Public Methods
    
    func performAction(for buttonNumber: Int) {
        if buttonNumber == 1 {
            config.viewConfig.button1Action?()
        } else {
            config.viewConfig.button2Action?()
        }
    }
}

//
//  AlertViewModel.swift
//  maindiish-ios
//
//  Created by Faizan Tanveer on 26/10/2023.
//

import Foundation

class AlertViewModel: ViewModel {
    
    var title: String
    var message: String
    
    init(title: String = "", message: String = "") {
        self.title = title
        self.message = message
    }
}

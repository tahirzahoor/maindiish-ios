//
//  TextViewModel.swift
//  maindiish-ios
//
//  Created by Faizan Tanveer on 04/12/2023.
//

import Foundation

class TextViewModel: ViewModel {
    
    // MARK: - Private Property
    
    var textType: HTMLFile
    
    // MARK: - Initializers
    
    init(textType: HTMLFile) {
        self.textType = textType
    }
    
}

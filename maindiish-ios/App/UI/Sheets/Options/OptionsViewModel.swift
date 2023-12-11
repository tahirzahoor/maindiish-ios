//
//  OptionsViewModel.swift
//  maindiish-ios
//
//  Created by Faizan Tanveer on 12/12/2023.
//

import Foundation

class OptionsViewModel: ViewModel {
    
    var options: [Option]
    
    init(optionList: [Option]) {
        self.options = optionList
    }
    
}

//
//  BottomUpOptionsSheetViewModel.swift
//  maindiish-ios
//
//  Created by Faizan Tanveer on 29/10/2023.
//

import Foundation

class BottomUpOptionsSheetViewModel: ViewModel {
    
    var optionsList: [String]
    var selectedOption: String {
        optionsList[selectedOptionIndex]
    }
    var selectedOptionIndex = 0
    
    init(optionsList: [String]) {
        self.optionsList = optionsList
    }
    
}

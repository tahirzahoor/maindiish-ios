//
//  ReviewBriefViewModel.swift
//  maindiish-ios
//
//  Created by Faizan Tanveer on 14/11/2023.
//

import Foundation

class ReviewBriefViewModel: ViewModel {
    
    // MARK: - Public Properties
    
    var brief: BriefData
    
    // MARK: - Public Methods
    
    init(brief: BriefData) {
        self.brief = brief
    }
    
    func publish() {
        // MARK: - to be implemented in next branch
    }
}

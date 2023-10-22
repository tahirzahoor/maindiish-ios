//
//  OnboardingViewModel.swift
//  BaseCode
//
//  Created by Faizan Tanveer on 18/10/2023.
//

import Foundation

class OnboardingViewModel: ViewModel {
    
    // MARK: - Instance Properties
    
    private let repository = OnboardingRepository()
    
    var onboardings: [OnboardingDetail]
    
    override init() {
        onboardings = repository.onboardingList()
        super.init()
    }
    
}

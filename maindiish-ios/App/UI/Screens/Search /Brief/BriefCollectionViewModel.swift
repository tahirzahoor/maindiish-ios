//
//  BriefCollectionViewModel.swift
//  maindiish-ios
//
//  Created by Faizan Tanveer on 18/11/2023.
//

import Foundation

class BriefCollectionViewModel: ViewModel {
    
    // MARK: - Private Properties
    
    private var briefData: [BriefData] { BriefRepository.shared.briefs }
    
    // MARK: - Public Properties
    
    var searchQuery = ""
    
    var filteredBriefs: [BriefData] {
        guard !searchQuery.isEmpty else { return briefData }
        
        return briefData.filter {
            $0.description.lowercased().contains(searchQuery.lowercased())
            || $0.tags.lowercased().contains(searchQuery.lowercased())
        }
    }
    
    // MARK: - Public Methods
    
    func addData() {
        BriefRepository.shared.briefs.insert(BriefData(description: "A new description# \(Int.random(in: 1...100))"), at: 0)
    }
    
}

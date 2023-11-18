//
//  BriefRepository.swift
//  maindiish-ios
//
//  Created by Faizan Tanveer on 19/11/2023.
//

import Foundation

class BriefRepository {
    
    // MARK: - Public Properties
    
    static let shared = BriefRepository()
    
    var briefs = [BriefData]()
    
    // MARK: - Private Methods
    
    private init() {
        briefs = loadData()
    }
    
    private func loadData() -> [BriefData] {
        Array(1...5000).map { BriefData(description: "This is description#\($0)", tags: "tag#\($0)") }
    }
    
}

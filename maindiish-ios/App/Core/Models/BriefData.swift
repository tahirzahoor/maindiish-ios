//
//  BriefData.swift
//  maindiish-ios
//
//  Created by Faizan Tanveer on 14/11/2023.
//

import Foundation

struct BriefData: Identifiable {
    
    // MARK: - Public Properties
    
    var id = UUID()
    var mediaType: MediaCaptureConfiguration.MediaType?
    var description = ""
    var tags = ""
    var views = Double.random(in: 1...1_000_000_000)
    var formattedCount: String {
        Utils.formatLargeNumber(views)
    }
    
}

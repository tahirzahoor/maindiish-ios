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
    var user = User()
    var mediaType: MediaCaptureConfiguration.MediaType?
    var title = "Briefs Title".times(3)
    var description = "Brief Description"
    var tags = ""
    var videoURL: URL? = VideoRepository.shared.videoURLs.randomElement()
    var views = Double.random(in: 1...1_000_000_000)
    var hearts = Double.random(in: 1...1_000_000_000)
    var comments = Double.random(in: 1...1_000)
    var formattedViewsCount: String {
        Utils.formatLargeNumber(views)
    }
    var formattedHeartsCount: String {
        Utils.formatLargeNumber(hearts)
    }
    var formattedCommentsCount: String {
        Utils.formatLargeNumber(comments)
    }
    
}

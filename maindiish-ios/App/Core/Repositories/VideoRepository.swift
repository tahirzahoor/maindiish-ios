//
//  VideoRepository.swift
//  maindiish-ios
//
//  Created by Faizan Tanveer on 03/12/2023.
//

import Foundation

class VideoRepository {
    
    static var shared = VideoRepository()
    
    var videoURLs: [URL] = []
    
    private init() {
        loadVideoURLs()
    }
    
    private func loadVideoURLs() {
        for name in 1...4 {
            if let url = Bundle.main.url(forResource: "\(name)", withExtension: "mp4") {
                videoURLs.append(url)
            }
        }
    }
    
}

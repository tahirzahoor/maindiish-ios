//
//  SavedItemsSection.swift
//  maindiish-ios
//
//  Created by Faizan Tanveer on 01/12/2023.
//

import Foundation

enum SavedItemsSection: Int, CaseIterable {
    case videos = 0
    case blogs
    
    var title: String {
        return switch self {
            case .blogs:
                "Blogs"
            case .videos:
                "Videos"
        }
    }
}

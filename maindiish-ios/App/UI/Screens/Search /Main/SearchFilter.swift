//
//  SearchFilter.swift
//  maindiish-ios
//
//  Created by Faizan Tanveer on 18/11/2023.
//

import Foundation

enum SearchFilter: Int, CaseIterable {
    case people = 0
    case brief
    case blog
    
    var cellIdentifier: String {
        return switch self {
            case .blog:
                ""
            default:
                ""
        }
    }
    
}

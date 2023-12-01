//
//  PostType.swift
//  maindiish-ios
//
//  Created by Faizan Tanveer on 14/11/2023.
//

import Foundation

enum PostType: Equatable {
    case brief(_ data: BriefData)
    case blog(_ data: PostData)
    
    var identifier: String {
        return switch self {
            case .blog(_):
                "blog"
            case .brief(_):
                "brief"
        }
    }
    
    static func == (lhs: PostType, rhs: PostType) -> Bool {
        lhs.identifier == rhs.identifier
    }
}

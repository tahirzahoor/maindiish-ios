//
//  MessageType.swift
//  maindiish-ios
//
//  Created by Faizan Tanveer on 19/12/2023.
//

import Foundation

enum MessageType: Equatable {
    case text(_ text: String)
    case link(_ previewImageData: Data, _ titleText: String, subtitleText: String)
    case image(_ imageData: Data)
    
    var id: String {
        switch self {
            case .text:
                return "text"
            case .link:
                return "link"
            case .image:
                return "image"
        }
    }
    
    static func ==(lhs: MessageType, rhs: MessageType) -> Bool {
        return lhs.id == rhs.id
    }
}

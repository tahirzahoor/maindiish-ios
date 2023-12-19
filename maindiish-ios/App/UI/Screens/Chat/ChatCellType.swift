//
//  ChatCellType.swift
//  maindiish-ios
//
//  Created by Faizan Tanveer on 19/12/2023.
//

import Foundation

enum ChatCellType {
    case send
    case received(_ senderProfileImageData: Data)
}

//
//  ChatCellData.swift
//  maindiish-ios
//
//  Created by Faizan Tanveer on 19/12/2023.
//

import Foundation

struct ChatCellData {
    
    // MARK: - Public Properties
    
    var cellType: ChatCellType
    var senderProfileImageData = Data()
    var imageData = Data()
    var title = ""
    var subtitle = ""
    
}

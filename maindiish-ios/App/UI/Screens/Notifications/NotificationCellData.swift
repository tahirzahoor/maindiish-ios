//
//  NotificationCellData.swift
//  maindiish-ios
//
//  Created by Faizan Tanveer on 22/12/2023.
//

import Foundation

struct NotificationCellData {
    
    // MARK: - Public Properties
    
    var cellType = NotificationCellType.actioned
    var userProfileImageData = Data()
    var actionedByUserProfileImageData = Data()
    var actionedOnImageData = Data()
    var notificationText = NSMutableAttributedString(string: "")
}

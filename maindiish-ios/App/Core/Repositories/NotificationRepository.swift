//
//  NotificationRepository.swift
//  maindiish-ios
//
//  Created by Faizan Tanveer on 22/12/2023.
//

import Foundation
import UIKit

class NotificationRepository {
    
    // MARK: - Shared Instance
    
    static let shared = NotificationRepository()
    
    // MARK: - Public Properties
    
    var sections = [
        NotificationSection(title: "New"),
        NotificationSection(title: "This Week"),
        NotificationSection(title: "This Month")
    ]
    
    // MARK: - Private Properties
    
    private var senderProfileImageData = UIImage(named: "dummy_dp")?.jpegData(compressionQuality: 0.8) ?? Data()
    private var dummyImageData = UIImage(named: "dummy_post_image")?.jpegData(compressionQuality: 0.8) ?? Data()
    private var actionedOnImageData = UIImage(named: "dummy_dp_2")?.jpegData(compressionQuality: 0.8) ?? Data()
    
    // MARK: - Private Methods
    
    private init() {
        loadData()
    }
    
    private func loadData() {
        for section in sections.indices {
            
            let rows = [
                NotificationCellData(
                    cellType: .followable,
                    userProfileImageData: senderProfileImageData,
                    notificationText: getAttributedNotificationText(text: "User#\(section + 1) who might know, is on instagram.", timeString: "21h")
                ),
                NotificationCellData(
                    cellType: .actioned,
                    userProfileImageData: senderProfileImageData,
                    actionedByUserProfileImageData: actionedOnImageData,
                    actionedOnImageData: dummyImageData,
                    notificationText: getAttributedNotificationText(text: "User#\(section + 1) who might know, is on instagram.", timeString: "21h")
                )
            ]
            
            sections[section].rows = rows
        }
    }
    
    private func getAttributedNotificationText(text: String, timeString: String) -> NSMutableAttributedString {
        
        let completeText = text + ".   " + timeString
        let attributedString = NSMutableAttributedString(string: completeText)
        
        var timeStringColor = UIColor(red: 0.822, green: 0.822, blue: 0.822, alpha: 1)
        
        if let range = text.range(of: timeString) {
            let range = NSRange(range, in: text)
            attributedString.addAttributes([NSAttributedString.Key.foregroundColor: timeStringColor], range: range)
        }
        
        attributedString.addAttributes([NSAttributedString.Key.font: Fonts.poppinsRegular.font(12)!], range: NSRange(location: 0, length: completeText.count))

       return attributedString
    }
}

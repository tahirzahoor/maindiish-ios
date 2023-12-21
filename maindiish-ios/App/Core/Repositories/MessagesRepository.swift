//
//  MessagesRepository.swift
//  maindiish-ios
//
//  Created by Faizan Tanveer on 21/12/2023.
//

import Foundation
import UIKit

class MessagesRepository {
    
    // MARK: - Shared Instances
    
    static let shared = MessagesRepository()
    
    // MARK: - Private Properties
    
    private let dummyTimeStrings = ["Today 8:49 AM", "Yesterday 7:51 PM", "Monday 10:55 AM", "Sunday 4:21 PM"].sorted()
    
    // MARK: - Public Properties
    
    var messages: [ChatCellData] = []
    var sections: [MessageSection] = []
    
    // MARK: - Private Properties
    
    private var senderProfileImageData = UIImage(named: "dummy_dp")?.jpegData(compressionQuality: 0.8) ?? Data()
    private var dummyImageData = UIImage(named: "dummy_post_image")?.jpegData(compressionQuality: 0.8) ?? Data()
    
    // MARK: - Private Methods
    
    private init() { 
        loadData()
    }
    
    private func loadData() {
        for timeString in dummyTimeStrings {
            let data = [
                ChatCellData(cellType: .send, title: "Message from sender ".times(4)),
                ChatCellData(cellType: .received, senderProfileImageData: senderProfileImageData, title: "Message from receiver ".times(11)),
                ChatCellData(cellType: .send, title: "Message from sender ".times(4)),
                ChatCellData(cellType: .sendLink, title: "New Link", subtitle: "New Link Description"),
                ChatCellData(cellType: .receiveLink, senderProfileImageData: senderProfileImageData, imageData: dummyImageData, title: "New Link", subtitle: "New Link Description")
            ]
            
            let messageSection = MessageSection(timeString: timeString, cells: data)
            sections.append(messageSection)
        }
    }
    
}

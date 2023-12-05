//
//  ChatListRepository.swift
//  maindiish-ios
//
//  Created by Faizan Tanveer on 05/12/2023.
//

import Foundation
import UIKit

class ChatListRepository {
    
    // MARK: - Shared Instance
    
    static var shared = ChatListRepository()
    
    // MARK: - Private Properties
    
    private var dummyImageData = UIImage(named: "dummy_dp")?.jpegData(compressionQuality: 0.8) ?? Data()
    
    // MARK: - Shared Properties
    
    var chats: [ChatListingData] {
        var chatList = [ChatListingData]()
        
        for i in 1...20 {
            let newChat = ChatListingData(
                imageData: dummyImageData,
                profileName: "Chat-\(i)",
                recentMessage: "You have a new message",
                recentMessageTime: "4:30 pm",
                unreadMessagesCount: i % 3 == 0 ? i : nil
            )
            
            chatList.append(newChat)
        }
        
        return chatList
    }
    
    // MARK: - Initializers
    
    private init() { }
    
}

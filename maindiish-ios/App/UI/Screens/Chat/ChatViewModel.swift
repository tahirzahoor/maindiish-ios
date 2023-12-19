//
//  ChatViewModel.swift
//  maindiish-ios
//
//  Created by Faizan Tanveer on 05/12/2023.
//

import Foundation

class ChatViewModel: ViewModel {
    
    // MARK: - Public Properties
    
    var user: User
    var cellData: [ChatCellData] {
        var data: [ChatCellData]
        
        data = [
            ChatCellData(
                cellType: .received(GlobalStrings.ImageData.dummyDP), messageType: .link(
                    PostRepository.shared.dummyImageData,
                    "Something new",
                    subtitleText: "Main Diish"
                )
            ),
            ChatCellData(
                cellType: .received(GlobalStrings.ImageData.dummyDP), messageType: .link(
                    PostRepository.shared.dummyImageData,
                    "Something new",
                    subtitleText: "Main Diish"
                )
            ),
            ChatCellData(
                cellType: .received(GlobalStrings.ImageData.dummyDP), messageType: .link(
                    PostRepository.shared.dummyImageData,
                    "Something new",
                    subtitleText: "Main Diish"
                )
            ),
            ChatCellData(
                cellType: .send, messageType: .text("New Message Received")
            ),
            ChatCellData(
                cellType: .send, messageType: .text("New Message Received".times(40))
            ),
            ChatCellData(
                cellType: .received(GlobalStrings.ImageData.dummyDP), messageType: .text("New Message".times(3))
            ),
            ChatCellData(
                cellType: .send,
                messageType: .link(
                    PostRepository.shared.dummyImageData,
                    "Something new",
                    subtitleText: "Main Diish"
                )
            ),
            ChatCellData(
                cellType: .received(GlobalStrings.ImageData.dummyDP),
                messageType: .text("New Message Received".times(50))
            )
        ]
        
        return data
    }
    
    // MARK: - Initializers
    
    init(user: User) {
        self.user = user
    }
}

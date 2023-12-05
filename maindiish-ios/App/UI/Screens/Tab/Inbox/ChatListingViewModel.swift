//
//  ChatListingViewModel.swift
//  maindiish-ios
//
//  Created by Faizan Tanveer on 05/12/2023.
//

import Foundation

class ChatListingViewModel: ViewModel {
    
    // MARK: - Private Properties
    
    private var chatList: [ChatListingData] { ChatListRepository.shared.chats }
    
    // MARK: - Public Properties
    
    var searchText = "" {
        didSet {
            filterData()
        }
    }
    
    var filteredChats: [ChatListingData] = []
    
    // MARK: - Initializers
    
    override init() {
        super.init()
        filterData()
    }
    
    // MARK: - Private Methods
    
    private func filterData() {
        guard !searchText.isEmpty else {
            filteredChats = chatList
            return
        }

        filteredChats = chatList
            .filter { chat in
                chat.profileName.contains(searchText)
                || chat.recentMessage.contains(searchText)
            }
    }
    
}

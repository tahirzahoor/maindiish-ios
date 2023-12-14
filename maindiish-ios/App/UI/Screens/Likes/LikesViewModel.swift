//
//  LikesViewModel.swift
//  maindiish-ios
//
//  Created by Faizan Tanveer on 14/12/2023.
//

import Foundation

class LikesViewModel: ViewModel {

    // MARK: - Private Properties
    
    private let likedByUsers: [User]
    
    // MARK: - Public Properties
    
    var searchedQuery = ""
    var searchFilteredUsers: [User] {
        guard !searchedQuery
            .isEmpty else { return likedByUsers }
        
        return likedByUsers.filter {
            $0.name.lowercased().contains(searchedQuery.lowercased())
        }
    }
    
    // MARK: - Initializers
    
    init(likedBy users: [User]) {
        self.likedByUsers = users
    }
    
    // MARK: - Public Methods
    
    func openProfile(forUserAt index: Int) {
        let user = likedByUsers[index]
        router.append(.profile(id: user.id.uuidString), animated: true)
    }
    
}

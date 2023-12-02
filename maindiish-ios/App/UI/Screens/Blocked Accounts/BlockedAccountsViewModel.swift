//
//  BlockedAccountsViewModel.swift
//  maindiish-ios
//
//  Created by Faizan Tanveer on 02/12/2023.
//

import Foundation

class BlockedAccountsViewModel: ViewModel {
    
    // MARK: - Public Proprties
    
    var blockedUsers: [User] = []
    
    // MARK: - Initializers
    
    override init() {
        super.init()
        
        loadBlockedAccounts()
    }
    
    // MARK: - Public Methods
    
    func openProfile(forUserAt index: Int) {
        let user = blockedUsers[index]
        router.append(.profile(id: user.id.uuidString), animated: true)
    }
    
    func loadBlockedAccounts() {
        let startIndex = Int.random(in: 0..<100)
        let endIndex = Int.random(in: 100..<200)
        
        let users = UserRepository.shared.users
        blockedUsers = Array(users[startIndex..<endIndex])
    }
    
}

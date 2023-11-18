//
//  SearchedPeopleViewModel.swift
//  maindiish-ios
//
//  Created by Faizan Tanveer on 18/11/2023.
//

import Foundation

class SearchedPeopleViewModel: ViewModel {
    
    // MARK: - Private Properties
    
    private var usersList: [User] { UserRepository.shared.users }
    
    // MARK: - Public Properties
    
    var searchedQuery = ""
    
    var filteredUsers: [User] {
        guard !searchedQuery
            .isEmpty else { return usersList }
        
        return usersList.filter {
            $0.name.lowercased().contains(searchedQuery.lowercased())
        }
    }
    
    // MARK: - Public Methods
    
    func addData() {
        let newUser = User(name: "New User \(Int.random(in: 200...1000))", followersCount: 0)
        UserRepository.shared.users.insert(newUser, at: 0)
    }
    
}

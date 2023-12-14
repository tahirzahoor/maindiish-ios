//
//  UserRepository.swift
//  maindiish-ios
//
//  Created by Faizan Tanveer on 18/11/2023.
//

import Foundation

class UserRepository {
    
    // MARK: - Private Properties
    
    private let names = ["Arsalan", "Faizan", "Ahsan", "Tahir", "Burhan", "Aqeel", "Zahid", "Farhan", "Sheraz", "Ahmar"]
    
    // MARK: - Public Properties
    
    static let shared = UserRepository()
    
    var users = [User]() 
    var randomUsers = [User]()
    
    // MARK: - Private Methods
    
    private init() { 
        users = loadData()
        
        let randomNum = Int.random(in: 0..<100)
        randomUsers = Array(users[0..<randomNum])
    }
    
    private func loadData() -> [User] {
        Array(1...100000).map { User(name: names[$0 % names.count], followersCount: Int.random(in: 0...10000)) }
    }
    
}

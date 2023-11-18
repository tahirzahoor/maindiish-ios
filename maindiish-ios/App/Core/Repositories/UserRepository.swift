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
    
    // MARK: - Private Methods
    
    private init() { 
        users = loadData()
    }
    
    private func loadData() -> [User] {
        Array(1...50).map { User(name: names[$0 % names.count], followersCount: Int.random(in: 0...10000)) }
    }
}

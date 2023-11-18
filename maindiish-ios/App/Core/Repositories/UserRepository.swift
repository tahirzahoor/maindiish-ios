//
//  UserRepository.swift
//  maindiish-ios
//
//  Created by Faizan Tanveer on 18/11/2023.
//

import Foundation

struct UserRepository {
    
    // MARK: - Private Methods
    
    private init() { }
    
    // MARK: - Public Properties
    
    static let shared = UserRepository()
    
    var users: [User] {
        Array(1...50).map { User(name: "User-\($0)", followersCount: Int.random(in: 0...10000)) }
    }
    
}

//
//  CommentsRepository.swift
//  maindiish-ios
//
//  Created by Faizan Tanveer on 14/12/2023.
//

import Foundation

class CommentsRepository {
    
    // MARK: - Shared Instance
    
    static let shared = CommentsRepository()
    
    // MARK: - Public Properties
    
    var comments: [Comment] = []
    
    // MARK: - Initializers
    
    private init() {
        comments = loadComments()
    }
    
    // MARK: - Private Methods
    
    private func loadComments() -> [Comment] {
        Array(1...10).map {
            Comment(
                commentTimeElapsed: "\($0) days",
                numberOfLikes: $0 * 4
            )
        }
    }
}

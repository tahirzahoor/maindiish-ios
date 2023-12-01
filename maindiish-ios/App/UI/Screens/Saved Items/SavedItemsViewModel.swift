//
//  SavedItemsViewModel.swift
//  maindiish-ios
//
//  Created by Faizan Tanveer on 29/11/2023.
//

import Foundation

class SavedItemsViewModel: ViewModel {
    
    // MARK: - Private Properties
    
    private lazy var savedItems: [PostType] = {
        var posts = [PostType]()
        for i in 0..<10 {
            let postData = PostRepository.shared.postData[i]
            let briefData = BriefRepository.shared.briefs[i]
            let postType: PostType = i % 2 == 0 ? .blog(postData) : .brief(briefData)
            posts.append(postType)
        }
        
        return posts
    }()
    
    // MARK: - Public Properties
    
    var blogs: [PostData] {
        let blogs = PostRepository.shared.postData
        let randomIntIndex = Int.random(in: 0..<50)
        return Array(blogs[0..<randomIntIndex])
    }
    
    var briefs: [BriefData] {
        let briefs = BriefRepository.shared.briefs
        let randomIntIndex = Int.random(in: 0..<50)
        return Array(briefs[0..<randomIntIndex])
    }
    
}

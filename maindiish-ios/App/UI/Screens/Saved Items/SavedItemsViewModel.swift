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
    
    var blogs: [PostData] = []
    var briefs: [BriefData] = []
    
    // MARK: - Initializers
    
    override init() {
        super.init()
        initializeBlogs()
        initializeBriefs()
    }
    
    // MARK: - Private Methods
    
    func initializeBriefs() {
        let randomIntIndex = Int.random(in: 0..<50)
        briefs = Array(BriefRepository.shared.briefs[0..<randomIntIndex])
    }
    
    func initializeBlogs() {
        let randomIntIndex = Int.random(in: 0..<50)
        blogs = Array(PostRepository.shared.postData[0..<randomIntIndex])
    }
    
}

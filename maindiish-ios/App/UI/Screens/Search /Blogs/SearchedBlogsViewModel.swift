//
//  SearchedBlogsViewModel.swift
//  maindiish-ios
//
//  Created by Faizan Tanveer on 18/11/2023.
//

import Foundation

class SearchedBlogsViewModel: ViewModel {
    
    // MARK: - Private Properties
    
    private var data: [PostData] { PostRepository.shared.postData }
    
    // MARK: - Public Properties
    
    @Published var searchQuery = ""

    var filteredData: [PostData] {
        guard !searchQuery.isEmpty else { return data }
        
        return data.filter {
            $0.title.lowercased().contains(searchQuery.lowercased())
            || $0.description.lowercased().contains(searchQuery.lowercased())
            || $0.byOwner.lowercased().contains(searchQuery.lowercased())
            || $0.tags.lowercased().contains(searchQuery.lowercased())
        }
    }
    
    func addData() {
        var newBlog = PostData()
        
        newBlog.title = "New Blog \(Int.random(in: 100...1000))"
        newBlog.owner = "Logged In User"
        newBlog.description = "In this we will learn to make new item"
        newBlog.tags = "#new #by #loggedInUser"
        newBlog.timeElapsedSincePosted = "just now"
        
        PostRepository.shared.postData.insert(newBlog, at: 0)
    }
}

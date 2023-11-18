//
//  SearchedBlogsViewModel.swift
//  maindiish-ios
//
//  Created by Faizan Tanveer on 18/11/2023.
//

import Foundation

class SearchedBlogsViewModel: ViewModel {
    
    // MARK: - Private Properties
    
    private var data = PostRepository.shared.postData
    
    // MARK: - Public Properties
    
    @Published var searchQuery = ""

    var filteredData: [PostData] {
        guard !searchQuery.isEmpty else { return data }
        
        return data.filter {
            $0.title.contains(searchQuery)
            || $0.description.contains(searchQuery)
            || $0.byOwner.contains(searchQuery)
            || $0.tags.contains(searchQuery)
        }
    }
}

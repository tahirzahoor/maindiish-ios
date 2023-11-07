//
//  ExploreViewModel.swift
//  maindiish-ios
//
//  Created by Faizan Tanveer on 01/11/2023.
//

import Foundation

class ExploreViewModel: ViewModel {
    
    private var repository = TrendingPostRepository()
    
    var data: [TrendingPostData] {
        repository.postData
    }
    
}

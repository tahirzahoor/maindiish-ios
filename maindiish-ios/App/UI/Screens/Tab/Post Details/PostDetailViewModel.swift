//
//  PostDetailViewModel.swift
//  maindiish-ios
//
//  Created by Faizan Tanveer on 08/11/2023.
//

import Foundation

class PostDetailViewModel: ViewModel {
    
    var data: TrendingPostData
    
    init(data: TrendingPostData) {
        self.data = data
    }
    
}

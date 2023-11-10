//
//  ReviewPostViewModel.swift
//  maindiish-ios
//
//  Created by Faizan Tanveer on 10/11/2023.
//

import Foundation

class ReviewPostViewModel: ViewModel {
    
    // MARK: - Public Properties
    
    var postData: PostData
    
    init(_ postData: PostData) {
        self.postData = postData
    }
}

//
//  CommentsViewModel.swift
//  maindiish-ios
//
//  Created by Faizan Tanveer on 14/12/2023.
//

import Foundation

class CommentsViewModel: ViewModel {
    
    // MARK: - Public Properties
    
    var comments = CommentsRepository.shared.comments
    
}

//
//  PostData.swift
//  maindiish-ios
//
//  Created by Faizan Tanveer on 10/11/2023.
//

import Foundation

struct PostData {
    
    var title = "New Post"
    var owner = "Logged In User"
    var byOwner: String {
        "by \(owner)"
    }
    var description = ""
    var tags = ""
    var imagesData = [Data]()
    var timeElapsedSincePosted = "just now"
    var numberOfHearts = 0
    var numberOfComments = 0
    var numberOfViews = 0
    var numberOfShares = 0

}

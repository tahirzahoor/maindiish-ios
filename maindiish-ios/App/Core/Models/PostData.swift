//
//  PostData.swift
//  maindiish-ios
//
//  Created by Faizan Tanveer on 10/11/2023.
//

import Foundation

struct PostData {
    
    var title = ""
    var owner = ""
    var byOwner: String {
        "by \(owner)"
    }
    var description = ""
    var tags = ""
    var imagesData = [Data]()

}

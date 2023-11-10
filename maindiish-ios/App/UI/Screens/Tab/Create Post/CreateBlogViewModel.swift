//
//  CreateBlogViewModel.swift
//  maindiish-ios
//
//  Created by Faizan Tanveer on 10/11/2023.
//

import Foundation
import UIKit

class CreateBlogViewModel: ViewModel {
    
    // MARK: - Public Properties

    var postData = PostData()

    // MARK: - Public Methods
    
    func validate() {
        if postData.title.isEmpty {
            alert = "Title is Empty"
        } else if postData.imagesData.isEmpty {
            alert = "Upload Images"
        } else {
            refineData()
            router.append(.reviewPost(postData), animated: true)
        }
    }
    
    // MARK: - Private Methods
    
    private func refineData() {
        if postData.tags == "#" {
            postData.tags = ""
        }
        postData.tags = postData.tags
            .split(separator: " ")
            .filter({ $0 != "#" })
            .joined(separator: " ")
            .trimmingCharacters(in: .whitespacesAndNewlines)
        
        postData.description = postData.description.trimmingCharacters(in: .whitespacesAndNewlines)
    }
    
}

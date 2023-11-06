//
//  TrendingPostRepository.swift
//  maindiish-ios
//
//  Created by Faizan Tanveer on 07/11/2023.
//

import Foundation

class TrendingPostRepository {
    
    // MARK: - Instance Properties
    
    var filterLabels: [String] = ["All", "Italian", "Desi", "Cuban"]
    
    var postData: [TrendingPostData] {
        loadData()
    }
    
    // MARK: - Public Methods
    
    init() {
        
    }
    
    private func loadData() -> [TrendingPostData] {
        var data = [TrendingPostData]()
        
        for i in 1...10 {
            let imageNames = Array<String>(repeating: "dummy_post_image", count: i)
            let postData = TrendingPostData(
                profileImageName: "dummy_dp",
                profileName: "Name-\(i)",
                postedTimeAgo: "30 mins ago",
                postDescription: "The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from de Finibus Bonorum et Malorum by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.",
                mediaImageNames: imageNames,
                numberOfHearts: i * i,
                numberOfComments: i + i,
                numberOfViews: i * 2 + i,
                numberOfShares: i * 4
            )
            
            data.append(postData)
        }
        
        return data
    }
    
}

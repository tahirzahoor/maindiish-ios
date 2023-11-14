//
//  CreateBriefViewModel.swift
//  maindiish-ios
//
//  Created by Faizan Tanveer on 14/11/2023.
//

import Foundation

class CreateBriefViewModel: ViewModel {
    
    // MARK: - Public Properties
    
    var briefData = BriefData()
    
    init(mediaType: MediaCaptureConfiguration.MediaType) {
        briefData.mediaType = mediaType
    }
    
    // MARK: - Public Methods
    
    func validate() {
        if briefData.mediaType == nil {
            alert = "Upload Image/Video"
        } else if briefData.description.isEmpty {
            alert = "Empty description"
        } else if briefData.tags.isEmpty {
            alert = "Empty tags"
        } else {
            refineData()
            router.append(.reviewBrief(briefData), animated: true)
        }
    }
   
    // MARK: - Private Methods
    
    private func refineData() {
        if briefData.tags == "#" {
            briefData.tags = ""
        }
        briefData.tags = briefData.tags
            .split(separator: " ")
            .filter({ $0 != "#" })
            .joined(separator: " ")
            .trimmingCharacters(in: .whitespacesAndNewlines)
        
        briefData.description = briefData.description.trimmingCharacters(in: .whitespacesAndNewlines)
    }

}

//
//  OptionsRepository.swift
//  maindiish-ios
//
//  Created by Faizan Tanveer on 12/12/2023.
//

import Foundation

class OptionsRepository {
    
    static let shared = OptionsRepository()
    
    var postOptions = [Option]()
    var reportOptions = [Option]()
    
    private init() {
        setOptions()
    }
    
    private func setOptions() {
        postOptions = [
            Option(imageName: "", text: "Copy link", cellType: .imageAndLabel()),
            Option(imageName: "", text: "Add to favourites", cellType: .imageAndLabel()),
            Option(imageName: "", text: "Unfollow", cellType: .imageAndLabel()),
            Option(imageName: "", text: "About this account", cellType: .imageAndLabel()),
            Option(imageName: "", text: "Report", cellType: .imageAndLabel(isRed: true))
        ]
        
        reportOptions = [
            Option(text: "Scammer", cellType: .singleLabel),
            Option(text: "Pretending to be someone else", cellType: .singleLabel),
            Option(text: "Fake Content/ Copied Content", cellType: .singleLabel),
            Option(text: "Abusive language", cellType: .singleLabel),
        ]
    }
}

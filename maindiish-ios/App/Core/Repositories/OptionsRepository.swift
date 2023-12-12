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
            Option(imageName: "copy_link", text: "Copy link", cellType: .imageAndLabel()),
            Option(imageName: "add_to_favs", text: "Add to favourites", cellType: .imageAndLabel()),
            Option(imageName: "unfollow_option", text: "Unfollow", cellType: .imageAndLabel()),
            Option(imageName: "about_this_account", text: "About this account", cellType: .imageAndLabel()),
            Option(imageName: "report_user", text: "Report", cellType: .imageAndLabel(isRed: true))
        ]
        
        reportOptions = [
            Option(text: "Scammer", cellType: .singleLabel),
            Option(text: "Pretending to be someone else", cellType: .singleLabel),
            Option(text: "Fake Content/ Copied Content", cellType: .singleLabel),
            Option(text: "Abusive language", cellType: .singleLabel),
        ]
    }
}

//
//  ImagesViewModel.swift
//  maindiish-ios
//
//  Created by Faizan Tanveer on 10/11/2023.
//

import Foundation

class ImagesViewModel: ViewModel {
    
    var imagesData: [Data]
    var selectedItemIndex: Int
    
    init(_ imagesData: [Data], selectedItemIndex: Int = 0) {
        self.imagesData = imagesData
        self.selectedItemIndex = selectedItemIndex
    }
    
}

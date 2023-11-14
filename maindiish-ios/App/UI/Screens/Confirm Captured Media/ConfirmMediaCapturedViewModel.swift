//
//  ConfirmMediaCapturedViewModel.swift
//  maindiish-ios
//
//  Created by Faizan Tanveer on 12/11/2023.
//

import Foundation

class ConfirmMediaCapturedViewModel: ViewModel {
    
    // MARK: - Public Properties
    
    var completion: ((Bool)->Void)?
    var mediaType: MediaCaptureConfiguration.MediaType?
    
    init(mediaType: MediaCaptureConfiguration.MediaType) {
        self.mediaType = mediaType
    }
    
}

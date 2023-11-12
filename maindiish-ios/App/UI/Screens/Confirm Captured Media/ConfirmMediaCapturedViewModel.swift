//
//  ConfirmMediaCapturedViewModel.swift
//  maindiish-ios
//
//  Created by Faizan Tanveer on 12/11/2023.
//

import Foundation

class ConfirmMediaCapturedViewModel: ViewModel {
    
    // MARK: - Public Properties
    
    var mediaType: MediaCaptureConfiguration.MediaType = .image
    var videoFileURL: URL?
    var imageData: Data?
    
    init(mediaType: MediaCaptureConfiguration.MediaType, videoFileURL: URL? = nil, imageData: Data? = nil) {
        self.mediaType = mediaType
        self.videoFileURL = videoFileURL
        self.imageData = imageData
    }
}

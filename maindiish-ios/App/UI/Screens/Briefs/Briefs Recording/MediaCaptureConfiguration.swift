//
//  MediaCaptureConfiguration.swift
//  maindiish-ios
//
//  Created by Faizan Tanveer on 12/11/2023.
//

import Foundation

struct MediaCaptureConfiguration {
    
    // MARK: - Enums
    
    public enum MediaType: String {
        case image = "public.image"
        case video = "public.movie"
        case any = "public.image,public.movie"
    }

    // MARK: - Outlets
    
    var mediaType: MediaType = .any
    var disableFrontCameraMirroring = true
    
}

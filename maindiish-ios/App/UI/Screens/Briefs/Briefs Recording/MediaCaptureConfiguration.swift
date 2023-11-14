//
//  MediaCaptureConfiguration.swift
//  maindiish-ios
//
//  Created by Faizan Tanveer on 12/11/2023.
//

import Foundation

struct MediaCaptureConfiguration {
    
    // MARK: - Enums
    
    public enum MediaType: Equatable {
        
        case images(data: [Data]? = nil)
        case video(fileURL: URL? = nil)
        case any
        
        var asString: String {
            return switch self {
                case .images:
                    "public.image"
                case .video:
                    "public.movie"
                case .any:
                    "public.image,public.movie"
            }
        }
        
        static func == (lhs: MediaType, rhs: MediaType) -> Bool {
            return lhs.asString == rhs.asString
        }
    }
    
    // MARK: - Outlets
    
    var mediaType: MediaType = .any
    var disableFrontCameraMirroring = true
    var libraryMediaSelectionLimit = 0
    
}

//
//  VideoCaptureViewModel.swift
//  maindiish-ios
//
//  Created by Faizan Tanveer on 12/11/2023.
//

import Foundation

class VideoCaptureViewModel: ViewModel {
    
    // MARK: - Delegate
    
    var confirmationDelegate: ConfirmMediaDelegate?
    
    // MARK: - Public Properties
    
    var createdMedia: MediaCaptureConfiguration.MediaType = .any 
    
    var imagesData = [Data]()
    var videoURL: URL?
    
    // MARK: - Public Methods
    
    init(delegate: ConfirmMediaDelegate) {
        super.init()
        
        confirmationDelegate = delegate
    }
    
    func confirmSelectedMedia() {
        let route = Route.confirmMediaCaptured(createdMedia) { confirmed in
            if confirmed {
                self.performConfirmation()
            }
        }
        
        router.present(route, animated: false)
    }
    
    func performConfirmation() {
        router.pop(animated: false)
        confirmationDelegate?.didConfirmSelectedMedia(type: createdMedia)
    }
    
}

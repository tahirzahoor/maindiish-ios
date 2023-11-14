//
//  ConfirmMediaDelegate.swift
//  maindiish-ios
//
//  Created by Faizan Tanveer on 14/11/2023.
//

import Foundation

protocol ConfirmMediaDelegate {
    func didConfirmSelectedMedia(type: MediaCaptureConfiguration.MediaType)
}

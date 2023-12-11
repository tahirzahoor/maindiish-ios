//
//  VideoPlayerManager.swift
//  BaseCode
//
//  Created by  on 17/01/2023.
//  Copyright © 2023 Brainx Technologies. All rights reserved.
//

import AVFoundation
import Foundation

class VideoPlayerManager {

    // MARK: - Instance Properties
    
    private var playerLayer: AVPlayerLayer?
    private var player: AVPlayer?
    
    // MARK: - Static Properties

    static let shared = VideoPlayerManager()

    // MARK: - Init Methods

    private init() {}

    // MARK: - Public Methods

}

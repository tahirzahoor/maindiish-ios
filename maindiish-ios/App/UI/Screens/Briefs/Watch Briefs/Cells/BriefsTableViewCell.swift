//
//  BriefsTableViewCell.swift
//  maindiish-ios
//
//  Created by Faizan Tanveer on 02/12/2023.
//
import AVFoundation
import AVKit
import UIKit

class BriefsTableViewCell: UITableViewCell {

    // MARK: - Outlets
    
    
    
    // MARK: - Private Properties
    
    private var playerLayer: AVPlayerLayer?
    
    // MARK: - Lifecycle Methods
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        playerLayer?.frame = contentView.bounds
    }

}

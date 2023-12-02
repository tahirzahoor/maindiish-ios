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
    
    @IBOutlet weak var videoPlayerView: UIView!
    @IBOutlet weak var profileImageHighlightedImageView: UIImageView!
    @IBOutlet weak var profilePictureImageView: UIImageView!
    @IBOutlet weak var profileTitleLabel: UILabel!
    @IBOutlet weak var briefDescriptionLabel: UILabel!
    @IBOutlet weak var tagsLabel: UILabel!
    @IBOutlet weak var followButton: CellButton!
    @IBOutlet weak var heartsButton: CellButton!
    @IBOutlet weak var commentsButton: CellButton!
    @IBOutlet weak var sharesButton: CellButton!
    
    // MARK: - Private Properties
    
    private var playerLayer: AVPlayerLayer?
    
    // MARK: - Public Properties
    
    var player: AVPlayer?
    
    // MARK: - Lifecycle Methods
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setFonts()
        configureFollowButtonView()
    }
   
    override func prepareForReuse() {
        super.prepareForReuse()
        playerLayer?.removeFromSuperlayer()
        player?.pause()
        player = nil
        playerLayer = nil
    }
    
    // MARK: - Private Methods
    
    private func setFonts() {
        profileTitleLabel.font = Fonts.robotoMedium.font(15)
        briefDescriptionLabel.font = Fonts.interMedium.font(12)
        tagsLabel.font = Fonts.interItalic.font(12)
        
        followButton.titleLabel?.font = Fonts.robotoRegular.font(12)
        
        let font = Fonts.interMedium.font(10)
        sharesButton.titleLabel?.font = font
        commentsButton.titleLabel?.font = font
        heartsButton.titleLabel?.font = font
    }
    
    private func configureFollowButtonView() {
        followButton.setTitle("Follow", for: .normal)
        followButton.backgroundColor = .clear
        followButton.layer.cornerRadius = 5
        followButton.layer.borderColor = UIColor.white.cgColor
        followButton.layer.borderWidth = 1
    }
    
    // MARK: - Public Methods
    
    func configure(with data: BriefData) {
        profileTitleLabel.text = data.user.name
        briefDescriptionLabel.text = "Lorem Ipsum is simply dummy text of the printing and typesetting industry."
        tagsLabel.text = "#tags ".times(7)
        
        sharesButton.setTitle(data.formattedViewsCount, for: .normal)
        commentsButton.setTitle(data.formattedViewsCount, for: .normal)
        heartsButton.setTitle(data.formattedViewsCount, for: .normal)
        
        if let url = data.videoURL {
            configure(with: url)
        }
    }
    
    // MARK: - Private Methods
    
    private func configure(with videoURL: URL) {
        let playerItem = AVPlayerItem(url: videoURL)
        player = AVPlayer(playerItem: playerItem)
        playerLayer = AVPlayerLayer(player: player)
        playerLayer!.videoGravity = .resizeAspect
        
        videoPlayerView.layer.addSublayer(playerLayer!)
        playerLayer!.frame = videoPlayerView.bounds
        
        NotificationCenter.default.addObserver(self, selector: #selector(playerDidFinishPlaying), name: .AVPlayerItemDidPlayToEndTime, object: player!.currentItem)
    }

    @objc
    private func playerDidFinishPlaying() {
        player?.seek(to: CMTime.zero)
        player?.play()
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self, name: .AVPlayerItemDidPlayToEndTime, object: player?.currentItem)
    }
}

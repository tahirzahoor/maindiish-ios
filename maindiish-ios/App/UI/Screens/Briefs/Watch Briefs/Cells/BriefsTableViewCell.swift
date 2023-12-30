//
//  BriefsTableViewCell.swift
//  maindiish-ios
//
//  Created by Faizan Tanveer on 02/12/2023.
//
import AVFoundation
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
    
    // MARK: - Lifecycle Methods
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setFonts()
        configureFollowButtonView()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        VideoPlayerManager.shared.stopPlayback()
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
    }
    
    // MARK: - Private Methods
    
    func playVideo(url: URL?) {
        guard let url = url else { return }
        VideoPlayerManager.shared.playVideo(url: url, inLayer: videoPlayerView.layer)
    }
    
    func stopVideo() {
        VideoPlayerManager.shared.stopPlayback()
    }
    
}

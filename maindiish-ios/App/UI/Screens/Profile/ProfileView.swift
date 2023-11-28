//
//  ProfileView.swift
//  maindiish-ios
//
//  Created by Faizan Tanveer on 20/11/2023.
//

import UIKit

class ProfileView: UIView {
    
    // MARK: - Outlets
    
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var displayImageView: UIImageView!
    @IBOutlet weak var profileNameLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var lovesLabel: UILabel!
    @IBOutlet weak var followersLabel: UILabel!
    @IBOutlet weak var followingLabel: UILabel!
    @IBOutlet weak var lovesCountLabel: UILabel!
    @IBOutlet weak var followersCountLabel: UILabel!
    @IBOutlet weak var followingsCountLabel: UILabel!
    @IBOutlet weak var followButton: UIButton!
    @IBOutlet weak var messageButton: UIButton!
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var tabCollectionView: UICollectionView!
    @IBOutlet weak var followAndMessageButtonsView: UIView!
    @IBOutlet weak var settingsButton: UIButton!
    @IBOutlet weak var buttonsViewHeightLayoutConstraint: NSLayoutConstraint!
    
    // MARK: - Lifecycle Methods
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        messageButton.layer.borderColor = UIColor.black.cgColor
        messageButton.layer.masksToBounds = true
        setFonts()
    }
    
    // MARK: - Private Methods
    
    private func setFonts() {
        usernameLabel.font = Fonts.robotoRegular.font(15)
        profileNameLabel.font = Fonts.interMedium.font(22)
        statusLabel.font = Fonts.interRegular.font(12)
        
        let statsLabelfont = Fonts.interRegular.font(14)
        lovesLabel.font = statsLabelfont
        followersLabel.font = statsLabelfont
        followingLabel.font = statsLabelfont
        
        let statsFont = Fonts.poppinsSemibold.font(18)
        lovesCountLabel.font = statsFont
        followersCountLabel.font = statsFont
        followingsCountLabel.font = statsFont
        
        let buttonTextFont = Fonts.robotoMedium.font(14)
        followButton.titleLabel?.font = buttonTextFont
        messageButton.titleLabel?.font = buttonTextFont
    }
    
}

//
//  FollowableUserNotificationTableViewCell.swift
//  maindiish-ios
//
//  Created by Faizan Tanveer on 22/12/2023.
//

import UIKit

class FollowableUserNotificationTableViewCell: UITableViewCell {

    // MARK: - Outlets
    
    @IBOutlet weak var imageHighlightedImageView: UIImageView!
    @IBOutlet weak var userProfilePictureImageView: UIImageView!
    @IBOutlet weak var notificationTextLabel: UILabel!
    @IBOutlet weak var followButton: UIButton!
    
    // MARK: - Lifecycle Methods
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setFonts()
    }
    
    // MARK: - Private Methods
    
    private func setFonts() {
        notificationTextLabel.font = Fonts.poppinsRegular.font(12)
        followButton.titleLabel?.font = Fonts.robotoRegular.font(12)
    }
    
    // MARK: - Public Methods
    
    func configure(with data: NotificationCellData) {
        userProfilePictureImageView.image = UIImage(data: data.userProfileImageData)
        notificationTextLabel.attributedText = data.notificationText
    }
    
}

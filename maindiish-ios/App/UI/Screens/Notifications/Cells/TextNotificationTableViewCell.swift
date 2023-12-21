//
//  TextNotificationTableViewCell.swift
//  maindiish-ios
//
//  Created by Faizan Tanveer on 22/12/2023.
//

import UIKit

class TextNotificationTableViewCell: UITableViewCell {

    // MARK: - Outlets
    
    @IBOutlet weak var userProfilePictureHighlightedImageView: UIImageView!
    @IBOutlet weak var userProfileImageView: UIImageView!
    @IBOutlet weak var notificationTextLabel: UILabel!
    @IBOutlet weak var actionedForProfileHighlightedImageView: UIImageView!
    @IBOutlet weak var actionedForProfileImageView: UIImageView!
    @IBOutlet weak var actionOnImageView: UIImageView!
    
    // MARK: - Lifecycle Methods
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setFonts()
    }
    
    // MARK: - Private Methods
    
    private func setFonts() {
        notificationTextLabel.font = Fonts.poppinsRegular.font(12)
    }
    
    // MARK: - Public Methods
    
    func configure(with data: NotificationCellData) {
        userProfileImageView.image = UIImage(data: data.userProfileImageData)
        actionedForProfileImageView.image = UIImage(data: data.actionedByUserProfileImageData)
        actionOnImageView.image = UIImage(data: data.actionedOnImageData)
        notificationTextLabel.attributedText = data.notificationText
    }

}

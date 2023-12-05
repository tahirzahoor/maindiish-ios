//
//  ChatListingTableViewCell.swift
//  maindiish-ios
//
//  Created by Faizan Tanveer on 05/12/2023.
//

import UIKit

class ChatListingTableViewCell: UITableViewCell {
    
    // MARK: - Outlets
    
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var recentMessageLabel: UILabel!
    @IBOutlet weak var recentMessageTimeLabel: UILabel!
    @IBOutlet weak var unreadMessagesCountLabel: UILabel!
    
    // MARK: - Lifecycle Methods
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setFonts()
    }
    
    // MARK: - Private Methods
    
    private func setFonts() {
        nameLabel.font = Fonts.robotoRegular.font(16)
        
        let font = Fonts.interRegular.font(12)
        recentMessageLabel.font = font
        recentMessageTimeLabel.font = font
        
        unreadMessagesCountLabel.font = Fonts.robotoMedium.font(12)
        unreadMessagesCountLabel.layer.cornerRadius = 11
        unreadMessagesCountLabel.layer.masksToBounds = true
    }
    
    // MARK: - Public Methods
    
    func configure(with data: ChatListingData) {
        profileImageView.image = UIImage(data: data.imageData)
        
        nameLabel.text = data.profileName
        recentMessageLabel.text = data.recentMessage
        recentMessageTimeLabel.text = data.recentMessageTime
        
        let unreadMessageCount = data.unreadMessagesCount ?? 0
        unreadMessagesCountLabel.isHidden = unreadMessageCount == 0
        unreadMessagesCountLabel.text = "\(unreadMessageCount)"
    }
    
}

//
//  UserTableViewCell.swift
//  maindiish-ios
//
//  Created by Faizan Tanveer on 02/12/2023.
//

import UIKit

class UserTableViewCell: UITableViewCell {
    
    // MARK: - Outlets
    
    @IBOutlet weak var highlightedImageView: UIImageView!
    @IBOutlet weak var profilePictureImageView: UIImageView!
    @IBOutlet weak var profileTitleLabel: UILabel!
    @IBOutlet weak var numberOfFollowersLabel: UILabel!
    
    // MARK: - Lifecycle Methods
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setFonts()
    }
    
    // MARK: - Private Methods
    
    private func setFonts() {
        profileTitleLabel.font = Fonts.robotoMedium.font(15)
        numberOfFollowersLabel.font = Fonts.poppinsLight.font(10)
    }
    
    // MARK: - Public Methods
    
    func setData(of user: User) {
        profileTitleLabel.text = user.name
        numberOfFollowersLabel.text = Utils.formatLargeNumber(Double(user.followersCount))
    }
}

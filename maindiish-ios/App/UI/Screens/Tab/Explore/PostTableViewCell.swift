//
//  PostTableViewCell.swift
//  maindiish-ios
//
//  Created by Faizan Tanveer on 06/11/2023.
//

import UIKit

class PostTableViewCell: UITableViewCell {

    // MARK: - Outlets
    
    @IBOutlet weak var blueCircleImageView: UIImageView!
    @IBOutlet weak var displayPictureImageView: UIImageView!
    @IBOutlet weak var profileNameLabel: UILabel!
    @IBOutlet weak var postedTimeAgoLabel: UILabel!
    @IBOutlet weak var followButton: RoundedButton!
    @IBOutlet weak var moreOptionsButton: UIButton!
    @IBOutlet weak var postDescriptionLabel: UILabel!
    @IBOutlet weak var mediaView: UIView!
    @IBOutlet weak var numberOfHeartsLabel: UILabel!
    @IBOutlet weak var numberOfCommentsLabel: UILabel!
    @IBOutlet weak var numberOfViewsLabel: UILabel!
    @IBOutlet weak var numberOfSharesLabel: UILabel!
    
    // MARK: - Lifecycle Methods
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setLabelFonts()
    }
   
    // MARK: - Private Methods
    
    private func setLabelFonts() {
        profileNameLabel.font = Fonts.robotoMedium.font(15)
        postedTimeAgoLabel.font = Fonts.poppinsLight.font(11.5)
        followButton.titleLabel?.font = Fonts.robotoRegular.font(10)
        postDescriptionLabel.font = Fonts.interMedium.font(18)
        
        let font = Fonts.poppinsRegular.font(11.5)
        numberOfHeartsLabel.font = font
        numberOfCommentsLabel.font = font
        numberOfViewsLabel.font = font
        numberOfSharesLabel.font = font
    }
    
}

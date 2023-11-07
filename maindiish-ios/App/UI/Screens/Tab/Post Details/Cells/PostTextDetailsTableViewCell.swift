//
//  PostTextDetailsTableViewCell.swift
//  maindiish-ios
//
//  Created by Faizan Tanveer on 08/11/2023.
//

import UIKit

class PostTextDetailsTableViewCell: UITableViewCell {

    // MARK: - Outlets
    
    @IBOutlet weak var displayImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var followButton: RoundedButton!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var tagsLabel: UILabel!
    @IBOutlet var buttonStack: [UIButton]!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setFonts()
    }
    
    private func setFonts() {
        nameLabel.font = Fonts.robotoMedium.font(15)
        followButton.titleLabel?.font = Fonts.robotoRegular.font(12)
        descriptionLabel.font = Fonts.interRegular.font(14)
        tagsLabel.font = Fonts.interItalic.font(12)
        
        for button in buttonStack {
            button.titleLabel?.font = Fonts.poppinsRegular.font(11.5)
        }
    }
    
    func configure(with data: TrendingPostData) {
        displayImageView.image = UIImage(named: data.profileImageName)
        nameLabel.text = data.profileName
        descriptionLabel.text = data.postDescription
        tagsLabel.text = "#tag"
    }

}

//
//  TrendingPostTableViewCell.swift
//  maindiish-ios
//
//  Created by Faizan Tanveer on 06/11/2023.
//

import UIKit

class TrendingPostTableViewCell: UITableViewCell {

    // MARK: - Outlets
    
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var timeAgoLabel: UILabel!
    @IBOutlet weak var followButton: RoundedButton!
    @IBOutlet weak var moreOptionsButton: UIButton!
    @IBOutlet weak var postDescriptionLabel: UILabel!
    @IBOutlet weak var mediaCollectionView: UICollectionView!
    @IBOutlet weak var mediaPageControl: UIPageControl!
    @IBOutlet weak var numberOfHeartsButton: UIButton!
    @IBOutlet weak var numberOfCommentsButton: UIButton!
    @IBOutlet weak var numberOfViewsButton: UIButton!
    @IBOutlet weak var numberOfSharesButton: UIButton!
    
    // MARK: - Lifecycle Methods
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setLabelFonts()
    }
   
    // MARK: - Private Methods
    
    private func setLabelFonts() {
        nameLabel.font = Fonts.robotoMedium.font(15)
        timeAgoLabel.font = Fonts.poppinsLight.font(11.5)
        followButton.titleLabel?.font = Fonts.robotoRegular.font(10)
        postDescriptionLabel.font = Fonts.interMedium.font(18)
        
        let font = Fonts.poppinsRegular.font(11.5)
        numberOfHeartsButton.titleLabel?.font = font
        numberOfCommentsButton.titleLabel?.font = font
        numberOfViewsButton.titleLabel?.font = font
        numberOfSharesButton.titleLabel?.font = font
    }
    
    // MARK: - Public Methods
    
    func configure(with data: TrendingPostData) {
        nameLabel.text = data.profileName
        timeAgoLabel.text = data.postedTimeAgo
        postDescriptionLabel.text = data.postDescription
        
        numberOfHeartsButton.titleLabel?.text = "\(data.numberOfHearts)"
        numberOfCommentsButton.titleLabel?.text = "\(data.numberOfComments)"
        numberOfViewsButton.titleLabel?.text = "\(data.numberOfViews)"
        numberOfSharesButton.titleLabel?.text = "\(data.numberOfShares)"
    }

}

//
//  SearchedBlogsTableViewCell.swift
//  maindiish-ios
//
//  Created by Faizan Tanveer on 18/11/2023.
//

import UIKit

class SearchedBlogsTableViewCell: UITableViewCell {

    // MARK: - Outlets
    
    @IBOutlet weak var thumbnailImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var authorTitleLabel: UILabel!
    @IBOutlet weak var numberOfHeartsButton: UIButton!
    @IBOutlet weak var numberOfCommentsButton: UIButton!
    @IBOutlet weak var numberOfViewsButton: UIButton!
    
    // MARK: - Lifecycle Methods
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    // MARK: - Private Methods
    
    private func setFonts() {
        titleLabel.font = Fonts.robotoMedium.font(15)
        descriptionLabel.font = Fonts.interMedium.font(18)
        
        let font = Fonts.poppinsRegular.font(11.5)
        numberOfHeartsButton.titleLabel?.font = font
        numberOfCommentsButton.titleLabel?.font = font
        numberOfViewsButton.titleLabel?.font = font
    }
    
    // MARK: - Public Methods
    
    func setData(_ data: PostData) {
        
        if let firstImageData = data.imagesData.first, let image = UIImage(data: firstImageData) {
            thumbnailImageView.image = image
        }
       
        titleLabel.text = data.title
        descriptionLabel.text = data.description
        
        numberOfHeartsButton.setTitle("\(data.numberOfHearts)", for: .normal)
        numberOfViewsButton.setTitle("\(data.numberOfViews)", for: .normal)
        numberOfCommentsButton.setTitle("\(data.numberOfComments)", for: .normal)
    }

}

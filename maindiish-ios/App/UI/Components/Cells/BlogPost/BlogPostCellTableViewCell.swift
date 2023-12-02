//
//  BlogPostCellTableViewCell.swift
//  maindiish-ios
//
//  Created by Faizan Tanveer on 01/12/2023.
//

import UIKit

class BlogPostCellTableViewCell: UITableViewCell {

    // MARK: - Outlets
    
    @IBOutlet weak var postImageView: UIImageView!
    @IBOutlet weak var postTitleLabel: UILabel!
    @IBOutlet weak var postDescriptionLabel: UILabel!
    @IBOutlet weak var byUserLabel: UILabel!
    @IBOutlet weak var numberOfHeartsButton: UIButton!
    @IBOutlet weak var numberOfCommentsButton: UIButton!
    @IBOutlet weak var numberOfViewsButton: UIButton!
    @IBOutlet weak var optionsButton: CellButton!
    
    // MARK: - Delegates
    
    var optionsButtonDelegate: OptionsButtonDelegate?
    
    // MARK: - Lifecycle Methods
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setFonts()
    }
    
    // MARK: - Action Methods
    
    @IBAction
    func optionsButtonTapped(_ sender: CellButton) {
        optionsButtonDelegate?.didTapOptionsButton?(forRowAt: sender.indexPath)
    }
    
    // MARK: - Private Methods
    
    private func setFonts() {
        postTitleLabel.font = Fonts.robotoMedium.font(15)
        postDescriptionLabel.font = Fonts.interRegular.font(10)
        byUserLabel.font = Fonts.interMedium.font(10)
        
        let font = Fonts.poppinsRegular.font(11.5)
        numberOfHeartsButton.titleLabel?.font = font
        numberOfCommentsButton.titleLabel?.font = font
        numberOfViewsButton.titleLabel?.font = font
    }
    
    func setData(_ data: PostData) {
        
        if let firstImageData = data.imagesData.first, let image = UIImage(data: firstImageData) {
            postImageView.image = image
        }
       
        postTitleLabel.text = data.title
        postDescriptionLabel.text = data.description
        byUserLabel.text = data.byOwner
        
        numberOfHeartsButton.setTitle("\(data.numberOfHearts)", for: .normal)
        numberOfViewsButton.setTitle("\(data.numberOfViews)", for: .normal)
        numberOfCommentsButton.setTitle("\(data.numberOfComments)", for: .normal)
    }
    
}

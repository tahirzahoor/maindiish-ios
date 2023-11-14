//
//  ReviewBriefView.swift
//  maindiish-ios
//
//  Created by Faizan Tanveer on 14/11/2023.
//

import UIKit

class ReviewBriefView: UIView {

   // MARK: - Outlets
    
    @IBOutlet weak var screenTitleLabel: UILabel!
    @IBOutlet weak var mediaView: UIView!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var tagsLabel: UILabel!
    @IBOutlet weak var publishButton: RoundedButton!
    @IBOutlet weak var videoIndicatorImageView: UIImageView!
    
    // MARK: - Lifecycle Methods
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setFonts()
    }
    
    // MARK: - Private Methods
    
    private func setFonts() {
        screenTitleLabel.font = Fonts.interMedium.font(16)
        descriptionLabel.font = Fonts.interRegular.font(14)
        tagsLabel.font = Fonts.interItalic.font(12)
        publishButton.titleLabel?.font = Fonts.robotoMedium.font(15)
    }
    
    // MARK: - Public Methods
    
    func setData(data: BriefData) {
        descriptionLabel.text = data.description
        tagsLabel.text = data.tags
    }
    
}

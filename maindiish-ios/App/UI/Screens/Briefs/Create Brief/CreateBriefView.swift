//
//  CreateBriefView.swift
//  maindiish-ios
//
//  Created by Faizan Tanveer on 14/11/2023.
//

import UIKit

class CreateBriefView: UIView {

    // MARK: - Outlets
    
    @IBOutlet weak var screenTitleLabel: UILabel!
    @IBOutlet weak var mediaView: UIView!
    @IBOutlet weak var descriptionTextView: UITextView!
    @IBOutlet weak var tagsTextView: UITextView!
    @IBOutlet weak var reviewButton: RoundedButton!
    @IBOutlet weak var innerMediaView: UIView!
    @IBOutlet weak var uploadMediaButton: UIButton!
    @IBOutlet weak var removeMediaButton: UIButton!
    @IBOutlet weak var videoIndicatorImageView: UIImageView!
    
    // MARK: - Lifecycle Methods
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setFonts()
        setInitialTexts()
    }
    
    // MARK: - Private Methods
    
    private func setFonts() {
        screenTitleLabel.font = Fonts.interMedium.font(16)
    
        descriptionTextView.font = Fonts.interRegular.font(14)
        tagsTextView.font = Fonts.interItalic.font(12)
       
        reviewButton.titleLabel?.font = Fonts.robotoMedium.font(15)
    }
    
    private func setInitialTexts() {
        tagsTextView.text = "#"
        descriptionTextView.text = ""
    }
    
}

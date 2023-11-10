//
//  CreateBlogView.swift
//  maindiish-ios
//
//  Created by Faizan Tanveer on 10/11/2023.
//

import UIKit

class CreateBlogView: UIView {

    // MARK: - Outlets
    
    @IBOutlet weak var screenTitleLabel: UILabel!
    @IBOutlet weak var addTitleLabel: UILabel!
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var wordCountLabel: UILabel!
    @IBOutlet weak var descriptionTextView: UITextView!
    @IBOutlet weak var tagsTextView: UITextView!
    @IBOutlet weak var uploadMediaButton: RoundedButton!
    @IBOutlet weak var mediaCollectionView: UICollectionView!
    @IBOutlet weak var reviewButton: RoundedButton!
    
    // MARK: - Lifecycle Methods
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setFonts()
        setInitialTexts()
        setMediaUploadButtonView()
    }
    
    // MARK: - Private Methods
    
    private func setFonts() {
        screenTitleLabel.font = Fonts.interMedium.font(16)
        
        let font = Fonts.interRegular.font(12)
        addTitleLabel.font = font
        descriptionLabel.font = font
        
        titleTextField.font = Fonts.interSemibold.font(15)
        
        descriptionTextView.font = Fonts.interRegular.font(14)
        tagsTextView.font = Fonts.interItalic.font(12)
        uploadMediaButton.titleLabel?.font = Fonts.interSemibold.font(15)
        
        reviewButton.titleLabel?.font = Fonts.robotoMedium.font(15)
    }
    
    private func setMediaUploadButtonView() {
        uploadMediaButton.layer.cornerRadius = 20
        uploadMediaButton.layer.borderWidth = 1
        uploadMediaButton.layer.borderColor = UIColor.border.cgColor
    }
    
    private func setInitialTexts() {
        tagsTextView.text = "#"
        descriptionTextView.text = ""
        screenTitleLabel.text = "Create New Blog"
    }
    
}

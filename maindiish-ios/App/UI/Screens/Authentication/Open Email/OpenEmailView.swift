//
//  OpenEmailView.swift
//  maindiish-ios
//
//  Created by Faizan Tanveer on 29/10/2023.
//

import UIKit

class OpenEmailView: UIView {

    @IBOutlet weak var checkEmailInboxLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var openEmailButton: RoundedButton!
    @IBOutlet weak var backButton: RoundedButton!
    
    // MARK: - Lifecycle Methods
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setLabels()
    }
    
    // MARK: - Private Methods
    
    private func setLabels() {
        checkEmailInboxLabel.font = Fonts.interRegular.font(22)
        descriptionLabel.font = Fonts.interRegular.font(15)
        
        let font = Fonts.interSemibold.font(15)
        openEmailButton.titleLabel?.font = font
        backButton.titleLabel?.font = font
    }
}

//
//  EditProfileView.swift
//  maindiish-ios
//
//  Created by Faizan Tanveer on 28/11/2023.
//

import UIKit

class EditProfileView: UIView {

    // MARK: - Outlets
    
    @IBOutlet weak var screenTitleLabel: UILabel!
    @IBOutlet weak var profileImageView: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var emailValueLabel: UILabel!
    @IBOutlet weak var bioLabel: UILabel!
    @IBOutlet weak var bioTextView: UITextView!
    
    // MARK: - Lifecycle Methods
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    // MARK: - Private Methods
    
    private func setFonts() {
        screenTitleLabel.font = Fonts.robotoRegular.font(15)
        
        var font = Fonts.interRegular.font(14)
        nameLabel.font = font
        bioLabel.font = font
        
        font = Fonts.interRegular.font(12)
        nameTextField.font = font
        emailValueLabel.font = font
        
        font = Fonts.poppinsRegular.font(12)
        bioTextView.font = font
    }
}

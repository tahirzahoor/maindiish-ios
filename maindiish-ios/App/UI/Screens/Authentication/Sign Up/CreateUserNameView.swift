//
//  CreateUserNameView.swift
//  BaseCode
//
//  Created by Faizan Tanveer on 22/10/2023.
//

import UIKit

class CreateUserNameView: UIView {

   // MARK: - Outlets
    
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var tellMeMoreAboutYourselfLabel: UILabel!
    @IBOutlet weak var createAUserNameLabel: UILabel!
    @IBOutlet weak var inputField: UITextField!
    @IBOutlet weak var signUpButton: RoundedButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
    }
    
    private func setupView() {
        tellMeMoreAboutYourselfLabel.font = Fonts.robotoRegular.font(28)
        createAUserNameLabel.font = Fonts.interRegular.font(12)
        
        let font = Fonts.interSemibold.font(15)
        signUpButton.titleLabel?.font = font
        
        tellMeMoreAboutYourselfLabel.text = "Tell Us more about\nyourself"
    }
    
}

//
//  CreateUserNameView.swift
//  BaseCode
//
//  Created by Faizan Tanveer on 22/10/2023.
//

import UIKit

class CreateUserNameView: UIView {

   // MARK: - Outlets
    
    @IBOutlet weak var tellMeMoreAboutYourselfLabel: UILabel!
    @IBOutlet weak var createAUserNameLabel: UILabel!
    @IBOutlet weak var inputField: UITextField!
    @IBOutlet weak var signUpButton: RoundedButton!
    @IBOutlet weak var forgotPasswordButton: UIButton!
    @IBOutlet weak var usernameAlreadyExistsLabel: UILabel!
    
    // MARK: - Lifecycle Methods
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
    }
    
    // MARK: - Private Methods
    
    private func setupView() {
        tellMeMoreAboutYourselfLabel.font = Fonts.robotoRegular.font(28)
        createAUserNameLabel.font = Fonts.interRegular.font(12)
        
        let robotoRegular12 = Fonts.robotoRegular.font(12)
        forgotPasswordButton.titleLabel?.font = robotoRegular12
        forgotPasswordButton.underlineText()
        usernameAlreadyExistsLabel.font = robotoRegular12
        
        let font = Fonts.interSemibold.font(15)
        signUpButton.titleLabel?.font = font
        
        tellMeMoreAboutYourselfLabel.text = GlobalStrings.Message.createUserNameScreenMessage
    }
    
}

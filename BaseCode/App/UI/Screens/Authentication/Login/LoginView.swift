//
//  LoginView.swift
//  BaseCode
//
//  Created by Faizan Tanveer on 20/10/2023.
//

import UIKit

class LoginView: UIView {
    
    // MARK: - Outlets
    
   
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var loginLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var passwordLabel: UILabel!
    @IBOutlet weak var forgotPasswordButton: UIButton!
    @IBOutlet weak var emailInputView: PaddedTextField!
    @IBOutlet weak var passwordInputView: PaddedTextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setLabelFonts()
    }
    
    func setLabelFonts() {
        
        loginLabel.font = Fonts.interRegular.font(28)
        
        let fieldsLabelFont = Fonts.interRegular.font(12)
        emailLabel.font = fieldsLabelFont
        passwordLabel.font = fieldsLabelFont
        
        setForgotPasswordButtonTitle()
    }
    
    func setForgotPasswordButtonTitle() {
        forgotPasswordButton.titleLabel?.font = Fonts.robotoRegular.font(12)
        forgotPasswordButton.underlineText()
    }

}

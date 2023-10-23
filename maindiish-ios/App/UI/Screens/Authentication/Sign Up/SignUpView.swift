//
//  SignUpView.swift
//  BaseCode
//
//  Created by Faizan Tanveer on 22/10/2023.
//

import UIKit

class SignUpView: UIView {

   // MARK: - Outlets
    
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var formTableView: UITableView!
    @IBOutlet weak var registerationLabel: UILabel!
    @IBOutlet weak var agreementConfirmationButton: UIButton!
    @IBOutlet weak var iAgreeWithLabel: UILabel!
    @IBOutlet weak var privacyPolicyButton: UIButton!
    @IBOutlet weak var andLabel: UILabel!
    @IBOutlet weak var termsAndConditionsButton: UIButton!
    @IBOutlet weak var nextButton: RoundedButton!
    @IBOutlet weak var iHaveAnAccountLabel: UILabel!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var needHelpLabel: UILabel!
    
    // MARK: - Lifecycle Methods
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
    }
    
    func setupView() {
        registerationLabel.font = Fonts.interRegular.font(28)
        
        let agreementStatementFont = Fonts.interRegular.font(12)
        iAgreeWithLabel.font = agreementStatementFont
        privacyPolicyButton.titleLabel?.font = agreementStatementFont
        andLabel.font = agreementStatementFont
        termsAndConditionsButton.titleLabel?.font = agreementStatementFont
        
        needHelpLabel.font = Fonts.interMedium.font(12)
        iHaveAnAccountLabel.font = Fonts.interRegular.font(12)
        
        loginButton.titleLabel?.font = Fonts.interRegular.font(12)
        loginButton.underlineText()
    }
    
}

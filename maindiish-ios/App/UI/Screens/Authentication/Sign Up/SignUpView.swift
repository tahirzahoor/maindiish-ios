//
//  SignUpView.swift
//  BaseCode
//
//  Created by Faizan Tanveer on 22/10/2023.
//

import UIKit

class SignUpView: UIView {

   // MARK: - Outlets
    
    @IBOutlet var fieldsLabel: [UILabel]!
    @IBOutlet var passwordFields: [UITextField]!
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var registerationLabel: UILabel!
    @IBOutlet weak var agreementConfirmationButton: UIButton!
    @IBOutlet weak var iAgreeWithLabel: UILabel!
    @IBOutlet weak var privacyPolicyButton: UIButton!
    @IBOutlet weak var andLabel: UILabel!
    @IBOutlet weak var termsAndConditionsButton: UIButton!
    @IBOutlet weak var nextButton: RoundedButton!
    @IBOutlet weak var iHaveAnAccountLabel: UILabel!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var needHelpButton: UIButton!
    
    // MARK: - Lifecycle Methods
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
    }
    
    private
    func setupView() {
        registerationLabel.font = Fonts.interRegular.font(28)
        
        setFieldsLabelFont()
        
        let agreementStatementFont = Fonts.interRegular.font(12)
        iAgreeWithLabel.font = agreementStatementFont
        privacyPolicyButton.titleLabel?.font = agreementStatementFont
        andLabel.font = agreementStatementFont
        termsAndConditionsButton.titleLabel?.font = agreementStatementFont
        
        needHelpButton.titleLabel?.font = Fonts.interMedium.font(12)
        iHaveAnAccountLabel.font = Fonts.interRegular.font(12)
        
        loginButton.titleLabel?.font = Fonts.interRegular.font(12)
        loginButton.underlineText()
    }
    
    private func setFieldsLabelFont() {
        fieldsLabel.enumerated().forEach { index, _ in
            fieldsLabel[index].font = Fonts.interRegular.font(12)
        }
    }
    
}

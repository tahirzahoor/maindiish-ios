//
//  ChangePasswordView.swift
//  maindiish-ios
//
//  Created by Faizan Tanveer on 29/11/2023.
//

import UIKit

class ChangePasswordView: UIView {
    
    // MARK: - Outlets
    
    @IBOutlet weak var screenTitleLabel: UILabel!
    @IBOutlet var fieldLabels: [UILabel]!
    @IBOutlet var textfields: [UITextField]!
    @IBOutlet var visibilityButtons: [UIButton]!
    @IBOutlet weak var verifyButton: UIButton!
    
    @IBOutlet weak var passwordChangedSuccessView: UIView!
    @IBOutlet weak var congratulationsLabel: UILabel!
    @IBOutlet weak var successMessageLabel: UILabel!
    @IBOutlet weak var goHomeButton: UIButton!
    @IBOutlet weak var backButton: UIButton!
    
    // MARK: - Lifecycle Methods
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setFonts()
        configureButtons()
    }
    
    // MARK: - Private Methods
    
    private func setFonts() {
        screenTitleLabel.font = Fonts.robotoRegular.font(15)
        
        let fieldLabelFont = Fonts.interRegular.font(12)
        fieldLabels.forEach { $0.font = fieldLabelFont }
        
        let textfieldFont = Fonts.interSemibold.font(15)
        textfields.forEach { $0.font = textfieldFont }
        
        verifyButton.titleLabel?.font = Fonts.robotoSemibold.font(15)
        
        congratulationsLabel.font = Fonts.interSemibold.font(26)
        successMessageLabel.font = Fonts.interRegular.font(16)
    }
    
    private func configureButtons() {
        visibilityButtons.forEach { button in
            button.setImage(AssetsImage.eyesOff.image, for: .selected)
            button.addTarget(self, action: #selector(didTapTextVisibilityButton(_:)), for: .touchUpInside)
        }
        configureGoHomeButtonTitle()
    }
    
    @objc
    private func didTapTextVisibilityButton(_ sender: UIButton) {
        guard let index = visibilityButtons.firstIndex(of: sender) else { return }
        
        sender.isSelected.toggle()
        textfields[index].isSecureTextEntry.toggle()
    }
    
    private func configureGoHomeButtonTitle() {
        let attributedString = NSMutableAttributedString(string: "Go Home")
        
        let attributes: [NSAttributedString.Key: Any] = [
            .font: Fonts.interRegular.font(16) ?? UIFont(),
            .foregroundColor: UIColor.appThemeColor,
            .underlineStyle: NSUnderlineStyle.single.rawValue
        ]

        attributedString.addAttributes(
            attributes,
            range: NSRange(
                location: 0,
                length: attributedString.length
            )
        )
        
        goHomeButton.setAttributedTitle(attributedString, for: .normal)
    }
    
}

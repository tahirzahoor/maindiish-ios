import UIKit

class ForgotPasswordView: UIView {

   // MARK: - Outlets
   
    @IBOutlet weak var screenDescriptionLabel: UILabel!
    @IBOutlet weak var resetThroughEmailView: BorderedView!
    @IBOutlet weak var resetThroughPhoneView: BorderedView!
    @IBOutlet weak var doesNotExistsInOurSystemLabel: UILabel!
    @IBOutlet weak var resetPasswordButton: RoundedButton!
    @IBOutlet weak var resetUsingPhoneButton: UIButton!
    @IBOutlet weak var countryDialCodeSelectionButton: UIButton!
    @IBOutlet weak var phoneNumberField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    
    // MARK: - Lifecycle Methods
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setScreenFonts()
    }
    
    private func setScreenFonts() {
        screenDescriptionLabel.font = Fonts.interRegular.font(15)
        
        let font = Fonts.interRegular.font(12)
        doesNotExistsInOurSystemLabel.font = font
        resetUsingPhoneButton.titleLabel?.font = font
        
        resetPasswordButton.titleLabel?.font = Fonts.robotoSemibold.font(15)
    }
    
    func setView(for selectedOption: PasswordResetOption) {
        
        let isResetThroughEmail = selectedOption == .email
        
        hideResetThroughEmailView(!isResetThroughEmail)
        hideResetThroughPhoneView(isResetThroughEmail)
        
        setLabels(isResetThroughEmail)
    }
    
    private func hideResetThroughPhoneView(_ hide: Bool) {
        resetThroughPhoneView.isHidden = hide
    }
    
    private func hideResetThroughEmailView(_ hide: Bool) {
        resetThroughEmailView.isHidden = hide
    }
    
    private func setLabels(_ isResetThroughEmail: Bool) {
        let description = isResetThroughEmail ? GlobalStrings.Message.resetThroughEmail : GlobalStrings.Message.resetThroughPhone
        
        let buttonTitle = isResetThroughEmail ? GlobalStrings.Title.resetPassword : GlobalStrings.Title.sendCode
        
        let doesNotExistInSystemText = GlobalStrings.Title.doesNotExistInSystem(isResetThroughEmail ? "email" : "phone number")
        
        screenDescriptionLabel.text = description
        resetPasswordButton.setTitle(buttonTitle, for: .normal)
        doesNotExistsInOurSystemLabel.text = doesNotExistInSystemText
        
    }
}

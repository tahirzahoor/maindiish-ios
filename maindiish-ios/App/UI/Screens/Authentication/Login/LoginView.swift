import UIKit

class LoginView: UIView {
    
    // MARK: - Outlets
    
    @IBOutlet weak var loginLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var passwordLabel: UILabel!
    @IBOutlet weak var forgotPasswordButton: UIButton!
    @IBOutlet weak var passwordInputField: UITextField!
    
    // MARK: - Lifecycle Methods
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setLabelFonts()
    }
    
    // MARK: - Public Methods
    
    func setLabelFonts() {
        
        loginLabel.font = Fonts.interRegular.font(28)
        
        let fieldsLabelFont = Fonts.interRegular.font(12)
        emailLabel.font = fieldsLabelFont
        passwordLabel.font = fieldsLabelFont
        
        setForgotPasswordButtonTitleView()
    }
    
    func setForgotPasswordButtonTitleView() {
        forgotPasswordButton.titleLabel?.font = Fonts.robotoRegular.font(12)
        forgotPasswordButton.underlineText()
    }

}

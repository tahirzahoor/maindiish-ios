import UIKit

class SetNewPasswordView: UIView {

    // MARK: - Outlets
    
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var newPasswordLabel: UILabel!
    @IBOutlet weak var repeatPasswordLabel: UILabel!
    @IBOutlet weak var saveButton: RoundedButton!
    @IBOutlet var inputFields: [UITextField]!
    
    // MARK: - Lifecycle Methods
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setLabels()
    }
    
    // MARK: - Private Methods
    
    private func setLabels() {
        descriptionLabel.font = Fonts.interRegular.font(22)
        
        let font = Fonts.interRegular.font(12)
        newPasswordLabel.font = font
        repeatPasswordLabel.font = font
        
        saveButton.titleLabel?.font = Fonts.interRegular.font(15)
    }
    
}

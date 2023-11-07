import Foundation
import UIKit

class ForgotPasswordViewController: ViewController<ForgotPasswordViewModel> {
    
    // MARK: - private properties
    
    private var viewIsToggled = false
    
    // MARK: - Outlets
    
    @IBOutlet weak var forgotPasswordView: ForgotPasswordView!
    
    // MARK: - Lifecycle Methods
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        title = "Forgot Password"
        navigationController?.setNavigationBarHidden(false, animated: false)
    }

    // MARK: - Action Methods
    
    @IBAction
    func countryDialCodeSelectionButtonTapped(_ sender: UIButton) {
        openBottomSheet()
    }
    
    @IBAction
    func resetPasswordButtonTapped(_ sender: RoundedButton) {
        guard !isEmptyField() else {
            viewModel.alert = GlobalStrings.Message.fillInRequiredFields
            return
        }
        
        viewModel.router.append(.typeCode, animated: true)
    }
    
    @IBAction
    func resetUsingPhoneButtonTapped(_ sender: UIButton) {
        
        viewIsToggled.toggle()
        
        let buttonTitle = viewIsToggled ? GlobalStrings.Title.resetThroughEmail : GlobalStrings.Title.resetThroughPhone
        
        sender.setTitle(buttonTitle, for: .normal)
        
        let viewType: PasswordResetOption = viewIsToggled ? .phone : .email
        
        forgotPasswordView.setView(for: viewType)
    }
    
    // MARK: - Private Methods
    
    private func isEmptyField() -> Bool {
        if viewIsToggled {
            return forgotPasswordView.phoneNumberField.text?.isEmpty ?? true
        } else {
            return forgotPasswordView.emailField.text?.isEmpty ?? true
        }
    }
    
    private func openBottomSheet() {
        let countryCodes = Utils.fetchCountryCodes()
        let options = countryCodes.map { "\($0.countryCode) (\($0.dialCode))" }
        let selectedOptionIndex = options.firstIndex {
            $0.contains(
                forgotPasswordView
                    .countryDialCodeSelectionButton
                    .titleLabel?
                    .text ?? ""
            )
        } ?? 0
        
        viewModel.router.showSheet(
            .bottomUp(
                options,
                selectedOptionIndex: selectedOptionIndex,
                delegate: self
            ),
            animated: true
        )
    }
    
}

// MARK: - BottomUpOptionsSheetDelegate Methods

extension ForgotPasswordViewController: BottomUpOptionsDelegate {
    func didSelectOption(_ option: String, at index: Int) {
        let selectedDialCode = viewModel.countryCodes[index].dialCode
        forgotPasswordView.countryDialCodeSelectionButton.setTitle(selectedDialCode, for: .normal)
    }
}

import Foundation

fileprivate typealias validationMessage = (title: String, Message: String)

class SignUpViewModel: ViewModel {
   
    private let repository = SignUpRepository(apiService: APIClient())
    var signUpData = SignUpDataModel()
    
    func validateData() {
        
        guard let message = invalidDataMessage() else {
            router.append(.createUsername(viewModel: nil), animated: true)
            return
        }
        
        alert = message.1
    }
    
    private func invalidDataMessage() -> validationMessage? {
    
        if fieldIsEmpty() {
            return validationMessage(
                GlobalStrings.Title.emptyField,
                GlobalStrings.Message.fillInRequiredFields
            )
        } else if isInvalidEmail() {
            return validationMessage(
                GlobalStrings.Title.invalidEmail,
                GlobalStrings.Message.enterValidEmail
            )
        } else if isInvalidPassword() {
            return validationMessage(
                GlobalStrings.Title.invalidPassword,
                GlobalStrings.Message.passwordMustContain
            )
        } else if passwordsDonotMatch() {
            return validationMessage(
                GlobalStrings.Title.mismatchedPasswords,
                GlobalStrings.Message.passwordsMustBeSame
            )
        } else if notAgreedToTerms() {
            return validationMessage(
                GlobalStrings.Title.termsNotAgreed,
                GlobalStrings.Message.agreeToTerms
            )
        }
        
        return nil
    }
   
    private func fieldIsEmpty() -> Bool {
        return signUpData.name.isEmpty ||
               signUpData.email.isEmpty ||
               signUpData.number.number.isEmpty ||
               signUpData.password.isEmpty ||
               signUpData.confirmPassword.isEmpty
    }
    
    private func isInvalidEmail() -> Bool {
        return !signUpData.email.isValidEmail
    }
    
    private func passwordsDonotMatch() -> Bool {
        return signUpData.password != signUpData.confirmPassword
    }
    
    private func notAgreedToTerms() -> Bool {
        return !signUpData.agreedToTerms
    }
    
    private func isInvalidPassword() -> Bool {
        return !signUpData.password.isValidPassword
    }
    
}

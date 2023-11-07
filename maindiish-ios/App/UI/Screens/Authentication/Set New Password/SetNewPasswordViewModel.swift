import Foundation

class SetNewPasswordViewModel: ViewModel {
    
    var newPassword = ""
    var reEnteredPassword = ""
    
    func validate() {
        if fieldsAreEmpty() {
            alert = GlobalStrings.Title.emptyField
        } else if isNotValidPassword() {
            alert = GlobalStrings.Title.invalidPassword
        } else if passwordsAreNotSame() {
            alert = GlobalStrings.Title.mismatchedPasswords
        } else {
            isLoading = true
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                self.isLoading = false
                self.router.setRoot(.home)
                self.router.append(.login, animated: false)
            }
        }
    }
    
    private func isNotValidPassword() -> Bool {
        !newPassword.isValidPassword
    }
    
    private func passwordsAreNotSame() -> Bool {
        newPassword != reEnteredPassword
    }
    
    private func fieldsAreEmpty() -> Bool {
        newPassword.isEmpty || reEnteredPassword.isEmpty
    }
}

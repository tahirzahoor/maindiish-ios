import Foundation

extension String {
    
    var isValidEmail: Bool {
        return NSPredicate(
                    format: "SELF MATCHES %@",
                    "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
                )
                .evaluate(with: self)
    }
    
    var isValidPassword: Bool {
        let passwordRegex = "^(?=.*[A-Z])(?=.*[a-z])(?=.*\\d)(?=.*[@#$%^&+=]).{8,}$"

        return range(of: passwordRegex, options: .regularExpression) != nil
    }
    
}

import Foundation

enum SignUpField: Int, CaseIterable {
    case name = 0, email, number, password, confirmPassword
    case country
}

struct SignUpDataModel {
    var name = ""
    var email = ""
    var number = Number()
    var password = ""
    var confirmPassword = ""
    var username = ""
    var agreedToTerms = false
    
    subscript(_ field: SignUpField) -> String {
        get {
            switch field {
                case .name:
                    return name
                case .email:
                    return email
                case .country:
                    return number.country
                case .number:
                    return number.number
                case .password:
                    return password
                case .confirmPassword:
                    return confirmPassword
            }
        }
        set {
            switch field {
                case .name:
                    name = newValue
                case .email:
                    email = newValue
                case .country:
                    number.country = newValue
                case .number:
                    number.number = newValue
                case .password:
                    password = newValue
                case .confirmPassword:
                    confirmPassword = newValue
            }
        }
    }
}

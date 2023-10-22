//
//  SignUpViewModel.swift
//  BaseCode
//
//  Created by Faizan Tanveer on 22/10/2023.
//

import Foundation

enum CellType: String {
    case singleTextFieldCell = "SingleTextFieldTableViewCell"
    case dropDownFieldCell = "DropDownSelectionTableViewCell"
    case secureFieldCell = "SecureTextFieldTableViewCell"
}

enum SignUpField {
    
    case name
    case email
    case number(String, String)
    case password
    case confirmPassword
    
    var fieldName: String {
        return switch self {
            case .name:
                "Name"
            case .email:
                "Email"
            case .number:
                "Number"
            case .password:
                "Password"
            case .confirmPassword:
                "Confirm Password"
        }
    }
    
    var placeHolder: String {
        let prefix = "Enter"
        
        return switch self {
            case .confirmPassword:
                "Re-enter password"
            default:
                prefix + " " + fieldName.lowercased()
        }
    }
}

struct CellData {
    var cellType: CellType
    var field: SignUpField
}

class SignUpViewModel: ViewModel {
    
    var formData: [CellData] {
        [
            CellData(cellType: .singleTextFieldCell, field: .name),
            CellData(cellType: .singleTextFieldCell, field: .email),
            CellData(cellType: .dropDownFieldCell, field: .number("", "")),
            CellData(cellType: .secureFieldCell, field: .password),
            CellData(cellType: .secureFieldCell, field: .confirmPassword)
        ]
    }
   
}

//
//  LegalAgreementType.swift
//  maindiish-ios
//
//  Created by Faizan Tanveer on 04/12/2023.
//

import Foundation

enum HTMLFile: String {
    case termsAndConditions = "terms_and_conditions"
    case privacyPolicy = "privacy_policy"
    
    var textToDisplay: NSAttributedString {
        Utils.attributedStringFromHTMLFile(rawValue)
    }
    
    var screenTitle: String {
        return switch self {
            case .termsAndConditions:
                GlobalStrings.Title.termsAndConditions
            case .privacyPolicy:
                GlobalStrings.Title.privacyPolicy
        }
    }
}

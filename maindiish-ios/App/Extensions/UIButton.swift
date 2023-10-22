//
//  UIButton.swift
//  BaseCode
//
//  Created by Faizan Tanveer on 22/10/2023.
//

import Foundation
import UIKit

extension UIButton {
    
    func underlineText() {
            guard let currentTitle = self.currentTitle else {
                return
            }
            
            let attributedString = NSMutableAttributedString(string: currentTitle)
            attributedString.addAttribute(NSAttributedString.Key.underlineStyle, value: NSUnderlineStyle.single.rawValue, range: NSRange(location: 0, length: currentTitle.count))
            
            self.setAttributedTitle(attributedString, for: .normal)
    }
    
}

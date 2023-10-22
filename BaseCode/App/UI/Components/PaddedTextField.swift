//
//  PaddedTextField.swift
//  BaseCode
//
//  Created by Faizan Tanveer on 22/10/2023.
//

import UIKit

@IBDesignable
class PaddedTextField: UITextField {

    @IBInspectable var top: CGFloat = 0
    @IBInspectable var bottom: CGFloat = 0
    @IBInspectable var leading: CGFloat = 0
    @IBInspectable var trailing: CGFloat = 0
    
    var padding: UIEdgeInsets {
        UIEdgeInsets(top: top, left: leading, bottom: bottom, right: trailing)
    }
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }

    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }

}

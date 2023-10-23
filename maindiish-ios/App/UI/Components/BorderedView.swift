//
//  BorderedView.swift
//  maindiish-ios
//
//  Created by Faizan Tanveer on 23/10/2023.
//

import UIKit

class BorderedView: UIView {

    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        /// reset color for UIInterfaceStyle
        setBorderColor()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    func commonInit() {
        layer.cornerRadius = 20
        layer.borderWidth = 1
        setBorderColor()
    }
    
    func setBorderColor() {
        layer.borderColor = UIColor.onboardingTitleLabel.cgColor
    }
    
}

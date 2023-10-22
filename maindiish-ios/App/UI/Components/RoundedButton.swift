//
//  RoundedButton.swift
//  BaseCode
//
//  Created by Faizan Tanveer on 20/10/2023.
//

import UIKit

class RoundedButton: UIButton {

    func setView(
        backgroundColor: UIColor = .appThemeColor,
        title: String? = nil,
        titleColor: UIColor = .white,
        titleFont: Fonts = .interSemibold,
        fontSize: CGFloat = 15,
        cornerRadius: CGFloat = 0
    ) {
        layer.cornerRadius = cornerRadius == 0 ? frame.size.height / 3 : cornerRadius
        layer.backgroundColor = backgroundColor.cgColor
        
        let buttonTitle = title == nil ? titleLabel?.text : title
        setTitle(buttonTitle, for: .normal)
        setTitleColor(.white, for: .normal)
        titleLabel?.font = titleFont.font(fontSize)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }

    private func commonInit() {
        
        let buttonSize = CGSize(width: 335, height: frame.height)
        frame.size = buttonSize

        layer.masksToBounds = true

        titleLabel?.textAlignment = .center
        setView()
    }
    
}


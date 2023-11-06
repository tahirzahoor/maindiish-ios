//
//  MainTabBar.swift
//  maindiish-ios
//
//  Created by Faizan Tanveer on 01/11/2023.
//

import UIKit

class MainTabBar: UITabBar {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        commonInit()
    }
    
    func commonInit() {
        let rectPath = UIBezierPath(rect: self.bounds)
        let circlePath = UIBezierPath(
            ovalIn: CGRect(
                x: 0,
                y: 0,
                width: 50,
                height: frame.size.height / 2
            )
        )
        rectPath.append(circlePath)
        rectPath.usesEvenOddFillRule = true
        rectPath.fill()
        addGradient(.vertical, withColor: [.onboardingTitleLabel.withAlphaComponent(0.52), .onboardingTitleLabel])
    }

}

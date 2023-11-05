//
//  CurveInTheMiddleView.swift
//  maindiish-ios
//
//  Created by Faizan Tanveer on 01/11/2023.
//

import UIKit

class CurveInTheMiddleView: UIView {

    override func draw(_ rect: CGRect) {
        super.draw(rect)
        let rectPath = UIBezierPath(rect: self.bounds)
        let circlePath = UIBezierPath(
            ovalIn: CGRect(
                x: (self.bounds.width / 2) - 50,
                y: self.bounds.height - 100,
                width: 100,
                height: 100
            )
        )
        rectPath.append(circlePath)
        rectPath.usesEvenOddFillRule = true
        UIColor.black.setFill()
        rectPath.fill()
    }

}

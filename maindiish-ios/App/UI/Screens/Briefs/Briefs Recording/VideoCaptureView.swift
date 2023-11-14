//
//  VideoCaptureView.swift
//  maindiish-ios
//
//  Created by Faizan Tanveer on 12/11/2023.
//

import UIKit

class VideoCaptureView: UIView {

    // MARK: - Outlets
    
    @IBOutlet weak var shutterButton: UIButton!
    @IBOutlet weak var bgView: UIView!
    @IBOutlet weak var uploadFromLibraryButton: UIButton!
    
    // MARK: - Private Properties

    private var circularLayer: CAShapeLayer?
    private var progressLayer: CAShapeLayer?
    
    // MARK: - Public Properties
    
    var animation: CABasicAnimation!
    
    // MARK: - Lifecycle Methods
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setView()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        circularLayer?.position = shutterButton.center
        progressLayer?.position = shutterButton.center
    }
    
    // MARK: - Private Methods
    
    func setView() {
        shutterButton.backgroundColor = .clear
        shutterButton.layer.cornerRadius = 30
        shutterButton.layer.borderWidth = 5
        shutterButton.layer.borderColor = UIColor.onboardingTitleLabel.cgColor
    }
    
    private func changeButtonView(_ isAnimating: Bool) {
        let buttonSizeTransform = isAnimating ? CGAffineTransform(scaleX: 1.5, y: 1.5) : .identity
        UIView.animate(withDuration: 0.2) {
            self.shutterButton.transform = buttonSizeTransform
        }
        
        let borderColor = isAnimating ? UIColor.clear.cgColor : UIColor.onboardingTitleLabel.cgColor
        shutterButton.layer.borderColor = borderColor
    }
    
    func animateCircularProgress(_ animate: Bool) {
        
        changeButtonView(animate)
        
        if animate {
            createCircularPath()
            animateProgress()
        } else {
            removeCircularPath()
        }
    }
    
    private func createCircularPath() {
        
        let bounds = shutterButton.bounds
        
        let radius: CGFloat = (bounds.height - shutterButton.layer.borderWidth) / 2.0
        let center = CGPoint(x: bounds.midX, y: bounds.midY)
        
        let circularPath = UIBezierPath(
            arcCenter: center,
            radius: radius,
            startAngle: -CGFloat.pi / 2,
            endAngle: 3 * CGFloat.pi / 2,
            clockwise: true
        )
        
        circularLayer = CAShapeLayer()
        circularLayer?.path = circularPath.cgPath
        circularLayer?.strokeColor = UIColor.onboardingTitleLabel.cgColor
        circularLayer?.fillColor = UIColor.clear.cgColor
        circularLayer?.lineWidth = 5.0
        
        shutterButton.layer.addSublayer(circularLayer!)
        
        progressLayer = CAShapeLayer()
        progressLayer!.path = circularPath.cgPath
        progressLayer!.strokeColor = UIColor.appThemeColor.cgColor
        progressLayer!.fillColor = UIColor.clear.cgColor
        progressLayer!.lineWidth = 4
        progressLayer!.lineCap = .round
        progressLayer!.strokeEnd = 0
        
        shutterButton.layer.addSublayer(progressLayer!)
    }
    
    private func removeCircularPath() {
        progressLayer?.removeAllAnimations()
        progressLayer?.removeFromSuperlayer()
        circularLayer?.removeFromSuperlayer()
    }
    
    private func animateProgress() {
        animation.fromValue = 0.0
        animation.toValue = 1.0
        animation.duration = 90.0
        animation.fillMode = .forwards
        animation.isRemovedOnCompletion = true

        progressLayer?.add(animation, forKey: "progressAnimation")
    }
    
}

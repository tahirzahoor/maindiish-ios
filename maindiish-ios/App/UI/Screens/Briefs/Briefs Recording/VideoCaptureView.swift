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
    
    private var circleLayer = CAShapeLayer()
    private var progressLayer = CAShapeLayer()
    private var startPoint = CGFloat(-Double.pi / 2)
    private var endPoint = CGFloat(3 * Double.pi / 2)
    
    // MARK: - Lifecycle Methods
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setView()
    }
    
    // MARK: - Private Methods
    
    func setView() {
        shutterButton.backgroundColor = .clear
        shutterButton.layer.cornerRadius = 30
        shutterButton.layer.borderWidth = 5
        shutterButton.layer.borderColor = UIColor.onboardingTitleLabel.cgColor
    }
    
    func updateButtonView(for state: UILongPressGestureRecognizer.State) {
        switch state {
            case .began:
                UIView.animate(withDuration: 0.2) {
                    self.shutterButton.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
                }
            
            case .ended:
                UIView.animate(withDuration: 0.2) {
                    self.shutterButton.transform = .identity
                }
            default:
                break
        }
    }
    
}

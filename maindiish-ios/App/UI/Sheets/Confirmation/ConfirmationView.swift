//
//  ConfirmationView.swift
//  maindiish-ios
//
//  Created by Faizan Tanveer on 14/12/2023.
//

import UIKit

class ConfirmationView: UIView {

    // MARK: - Outlets
    
    @IBOutlet weak var backgroundView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var firstButton: UIButton!
    @IBOutlet weak var secondButton: UIButton!
    @IBOutlet weak var blockSuccessLabell: UILabel!
    @IBOutlet weak var blockSuccessView: UIView!
    @IBOutlet weak var buttonsView: UIView!
    
    // MARK: - Lifecycle Methods
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setFonts()
    }
    
    // MARK: - Private Methods
    
    private func setFonts() {
        titleLabel.font = Fonts.interRegular.font(16)
        
        let buttonFont = Fonts.robotoMedium.font(15)
        firstButton.titleLabel?.font = buttonFont
        secondButton.titleLabel?.font = buttonFont
    }
    
    // MARK: - Public Methods
    
    func configureView(with config: ConfirmationViewConfiguration) {
        titleLabel.text = config.title
        
        firstButton.setTitle(config.button1Title, for: .normal)
        secondButton.setTitle(config.button2Title, for: .normal)
    }
}

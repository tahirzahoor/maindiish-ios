//
//  TypeCodeView.swift
//  maindiish-ios
//
//  Created by Faizan Tanveer on 29/10/2023.
//

import UIKit

class TypeCodeView: UIView {

    // MARK: - Outlets
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var didnotReceiveCodeLabel: UILabel!
    @IBOutlet weak var resendButton: UIButton!
    
    // MARK: - Lifecycle Methods
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setLabels()
    }
    
    // MARK: - Private Methods
    
    private func setLabels() {
        titleLabel.font = Fonts.interRegular.font(22)
        
        let font = Fonts.interRegular.font(15)
        descriptionLabel.font = font
        didnotReceiveCodeLabel.font = font
        resendButton.titleLabel?.font = font
    }
    
}

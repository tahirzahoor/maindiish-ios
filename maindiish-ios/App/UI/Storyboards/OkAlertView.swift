//
//  OkAlertView.swift
//  maindiish-ios
//
//  Created by Faizan Tanveer on 26/10/2023.
//

import UIKit

class OkAlertView: UIView {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var messageLabel: UILabel!
   
    // MARK: - Public Methods
    
    func setData(title: String, message: String) {
        titleLabel.text = title
        messageLabel.text = message
    }
    
}

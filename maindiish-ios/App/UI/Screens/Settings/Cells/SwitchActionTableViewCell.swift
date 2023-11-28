//
//  SwitchActionTableViewCell.swift
//  maindiish-ios
//
//  Created by Faizan Tanveer on 28/11/2023.
//

import UIKit

class SwitchActionTableViewCell: UITableViewCell {
    
    // MARK: - Outlets
    
    @IBOutlet weak var actionNameLabel: UILabel!
    @IBOutlet weak var toggleSwitch: UISwitch!
    
    // MARK: - Lifecycle Methods
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setFonts()
    }
    
    // MARK: - Private Methods
    
    private func setFonts() {
        actionNameLabel.font = Fonts.interRegular.font(14)
    }
    
}

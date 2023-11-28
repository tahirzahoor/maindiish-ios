//
//  SettingsSectionHeaderTableViewCell.swift
//  maindiish-ios
//
//  Created by Faizan Tanveer on 28/11/2023.
//

import UIKit

class SettingsSectionHeaderTableViewCell: UITableViewCell {
    
    // MARK: - Outlets
    
    @IBOutlet weak var headerLabel: UILabel!
    
    // MARK: - Lifecycle Methods
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setFonts()
    }
    
    // MARK: - Private Methods
    
    private func setFonts() {
        headerLabel.font = Fonts.interBold.font(14)
    }
}

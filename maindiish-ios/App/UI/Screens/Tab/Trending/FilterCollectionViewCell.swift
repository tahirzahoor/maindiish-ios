//
//  FilterCollectionViewCell.swift
//  maindiish-ios
//
//  Created by Faizan Tanveer on 06/11/2023.
//

import UIKit

class FilterCollectionViewCell: UICollectionViewCell {
    
    
    @IBOutlet weak var filterLabel: UILabel!
    
    // MARK: - Lifecycle Methods
    
    override func awakeFromNib() {
        filterLabel.font = Fonts.robotoMedium.font(12)
    }
    
    // MARK: - Public Methods
    
    func setSelection(_ isSelected: Bool) {
        let labelColor = isSelected ? UIColor.white : UIColor.trendinsButtonText
        let bgColor = isSelected ? UIColor.appThemeColor : UIColor.cardBackground
        
        filterLabel.textColor = labelColor
        contentView.backgroundColor = bgColor
    }
    
}

//
//  ProfileTabCollectionViewCell.swift
//  maindiish-ios
//
//  Created by Faizan Tanveer on 21/11/2023.
//

import UIKit

class ProfileTabCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Outlets
    
    @IBOutlet weak var tabTitleLabel: UILabel!
    @IBOutlet weak var tabSelectedIndicatorView: UIView!
    
    // MARK: - Lifecycle Methods
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setFonts()
    }
    
    // MARK: - Private Methods
    
    private func setFonts() {
        tabTitleLabel.font = Fonts.interRegular.font(14)
    }
    
    // MARK: - Public Methods
    
    func setView(isSelected: Bool) {
        let color = isSelected ? UIColor.appThemeColor : UIColor.peopleListText
        tabTitleLabel.textColor = color
        
        tabSelectedIndicatorView.isHidden = !isSelected
    }
}

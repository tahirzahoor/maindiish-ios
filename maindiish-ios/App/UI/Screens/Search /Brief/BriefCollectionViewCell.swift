//
//  BriefCollectionViewCell.swift
//  maindiish-ios
//
//  Created by Faizan Tanveer on 18/11/2023.
//

import UIKit

class BriefCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Outlets
    
    @IBOutlet weak var thumbnailImageView: UIImageView!
    @IBOutlet weak var viewsCountLabel: UILabel!
    
    // MARK: - Lifecycle Methods
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setFonts()
    }
    
    // MARK: - Private Methods
    
    private func setFonts() {
        viewsCountLabel.font = Fonts.poppinsRegular.font(11.5)
    }
    
}

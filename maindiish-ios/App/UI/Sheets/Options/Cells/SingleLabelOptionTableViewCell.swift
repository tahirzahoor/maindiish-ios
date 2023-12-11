//
//  SingleLabelOptionTableViewCell.swift
//  maindiish-ios
//
//  Created by Faizan Tanveer on 12/12/2023.
//

import UIKit

class SingleLabelOptionTableViewCell: UITableViewCell {

   // MARK: - Outlets
    
    @IBOutlet weak var optionLabel: UILabel!
    
    // MARK: - Lifecycle Methods
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setFont()
    }
    
    // MARK: - Private Methods
    
    private func setFont() {
        optionLabel.font = Fonts.interMedium.font(14)
    }
    
    // MARK: - Public Methods
    
    func configure(with data: Option) {
        optionLabel.text = data.text
    }
}

//
//  SendLinkTableViewCell.swift
//  maindiish-ios
//
//  Created by Faizan Tanveer on 20/12/2023.
//

import UIKit

class SendLinkTableViewCell: UITableViewCell {

    // MARK: - Outlets
    
    @IBOutlet weak var linkPreviewImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    
    // MARK: - Lifecycle Methods
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setFonts()
        linkPreviewImageView.roundCorner([.layerMinXMinYCorner, .layerMaxXMinYCorner], radius: 16)
    }
    
    // MARK: - Public Methods
    
    func setFonts() {
        titleLabel.font = Fonts.interRegular.font(14)
        subtitleLabel.font = Fonts.robotoRegular.font(12.5)
    }
    
    // MARK: - Public Methods
    
    func configure(with data: ChatCellData) {
        titleLabel.text = data.title
        subtitleLabel.text = data.subtitle
    }
    
}

//
//  ReceiveLinkTableViewCell.swift
//  maindiish-ios
//
//  Created by Faizan Tanveer on 20/12/2023.
//

import UIKit

class ReceiveLinkTableViewCell: UITableViewCell {

    // MARK: - Outlets
    
    @IBOutlet weak var senderProfilePictureImageView: UIImageView!
    @IBOutlet weak var linkPreviewImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    
    // MARK: - Lifecycle Method
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setFonts()
        linkPreviewImageView.roundCorner([.layerMinXMinYCorner, .layerMaxXMinYCorner], radius: 16)
    }
    
    // MARK: - Private Methods
    
    private func setFonts() {
        titleLabel.font = Fonts.interRegular.font(14)
        subtitleLabel.font = Fonts.robotoRegular.font(12.5)
    }
    
    // MARK: - Public Methods
    
    func configure(with data: ChatCellData) {
        senderProfilePictureImageView.image = UIImage(data: data.senderProfileImageData)
        linkPreviewImageView.image = UIImage(data: data.imageData)
        titleLabel.text = data.title
        subtitleLabel.text = data.subtitle
    }
}

//
//  SendMessageTableViewCell.swift
//  maindiish-ios
//
//  Created by Faizan Tanveer on 19/12/2023.
//

import UIKit

class SendMessageTableViewCell: UITableViewCell {

   // MARK: - Outlets
    
    @IBOutlet weak var singleMessageView: UIView!
    @IBOutlet weak var singleMessageLabel: UILabel!
    @IBOutlet weak var linkMessageView: UIView!
    @IBOutlet weak var linkPreviewImageView: UIImageView!
    @IBOutlet weak var linkTitleLabel: UILabel!
    @IBOutlet weak var linkSubtitleLabel: UILabel!
    
    
    // MARK: - Lifecycle Methods
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setFonts()
        linkPreviewImageView.layer.masksToBounds = true
    }
    
    // MARK: - Private Methods
    
    private func setFonts() {
        singleMessageLabel.font = Fonts.interRegular.font(14)
        linkTitleLabel.font = Fonts.interRegular.font(14)
        linkSubtitleLabel.font = Fonts.robotoRegular.font(12.5)
    }
    
    // MARK: - Private Methods
    
    func configure(with data: ChatCellData) {
        switch data.messageType {
            case .text(let text):
                singleMessageLabel.text = text
                linkMessageView.isHidden = true
                singleMessageView.isHidden = false
            case .link(let imageData, let titleText, let subtitleText):
                linkPreviewImageView.image = UIImage(data: imageData)
                linkTitleLabel.text = titleText
                linkSubtitleLabel.text = subtitleText
                linkMessageView.isHidden = false
                singleMessageView.isHidden = true
        }
        
    }
}

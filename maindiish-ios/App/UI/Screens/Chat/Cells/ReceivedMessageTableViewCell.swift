//
//  ReceivedMessageTableViewCell.swift
//  maindiish-ios
//
//  Created by Faizan Tanveer on 19/12/2023.
//

import UIKit

class ReceivedMessageTableViewCell: UITableViewCell {

    // MARK: - Outlets
    
    @IBOutlet weak var singleMessageView: UIView!
    @IBOutlet weak var singleMessageLabel: UILabel!
    @IBOutlet weak var linkMessageView: UIView!
    @IBOutlet weak var linkMessagePreviewImageView: UIImageView!
    @IBOutlet weak var receivedMessageProfileImageView: UIImageView!
    @IBOutlet weak var linkMessageTitleLabel: UILabel!
    @IBOutlet weak var linkMessageSubtitleLabel: UILabel!
    
    // MARK: - Lifecycle Methods
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setFonts()
    }
    
    // MARK: - Private Methods
    
    private func setFonts() {
        singleMessageLabel.font = Fonts.interRegular.font(14)
        linkMessageTitleLabel.font = Fonts.interRegular.font(14)
        linkMessageSubtitleLabel.font = Fonts.robotoRegular.font(12.5)
    }
    
    // MARK: - Private Methods
    
    func configure(with data: ChatCellData) {
        switch data.messageType {
            case .text(let text):
                singleMessageLabel.text = text
                linkMessageView.isHidden = true
                singleMessageView.isHidden = false
            case .link(let imageData, let titleText, let subtitleText):
                linkMessagePreviewImageView.image = UIImage(data: imageData)
                linkMessageTitleLabel.text = titleText
                linkMessageSubtitleLabel.text = subtitleText
                linkMessageView.isHidden = false
                singleMessageView.isHidden = true
        }
        
    }
    
}

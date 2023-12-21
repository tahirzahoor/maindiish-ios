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
    
    // MARK: - Lifecycle Methods
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setFonts()
    }
    
    // MARK: - Private Methods
    
    private func setFonts() {
        singleMessageLabel.font = Fonts.interRegular.font(14)
    }
    
    // MARK: - Private Methods
    
    func configure(with data: ChatCellData) {
        singleMessageLabel.text = data.title
    }
}

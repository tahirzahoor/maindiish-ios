//
//  ReceivedImageTableViewCell.swift
//  maindiish-ios
//
//  Created by Faizan Tanveer on 20/12/2023.
//

import UIKit

class ReceivedImageTableViewCell: UITableViewCell {

   // MARK: - Outlets

    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var messageMediaImageView: UIImageView!
    
    // MARK: - Public Methods
    
    func configure(with data: ChatCellData) {
        profileImageView.image = UIImage(data: data.senderProfileImageData)
        messageMediaImageView.image = UIImage(data: data.imageData)
    }
    
}

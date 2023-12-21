//
//  SendImageTableViewCell.swift
//  maindiish-ios
//
//  Created by Faizan Tanveer on 20/12/2023.
//

import UIKit

class SendImageTableViewCell: UITableViewCell {

    // MARK: - Outlets
    
    @IBOutlet weak var mediaMessageImageView: UIImageView!
    
    // MARK: - Public Methods
    
    func configure(with data: ChatCellData) {
        mediaMessageImageView.image = UIImage(data: data.imageData)
    }
    
}

//
//  PostImageTableViewCell.swift
//  maindiish-ios
//
//  Created by Faizan Tanveer on 08/11/2023.
//

import UIKit

class PostImageTableViewCell: UITableViewCell {

    // MARK: - Outlets
    
    @IBOutlet weak var postImageView: UIImageView!
   
    func setImage(_ imageName: String) {
        postImageView.image = UIImage(named: imageName)
    }

}

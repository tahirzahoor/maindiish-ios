//
//  SearchedPeopleCell.swift
//  maindiish-ios
//
//  Created by Faizan Tanveer on 18/11/2023.
//

import Foundation
import UIKit

class SearchedPeopleCell: UITableViewCell {
   
    // MARK: - Outlets
    
    @IBOutlet weak var highlightIndicatorImageView: UIImageView!
    @IBOutlet weak var displayPictureImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var followersLabel: UILabel!
    
    // MARK: - Lifecycle Methods
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setFonts()
    }
        
    // MARK: - Private Methods
    
    private func setFonts() {
        nameLabel.font = Fonts.robotoMedium.font(15)
        followersLabel.font = Fonts.poppinsLight.font(10)
    }
    
    // MARK: - Public Methods
    
    func configureCell(withDataOf user: User) {
        nameLabel.text = user.name
        followersLabel.text = "\(user.followersCount)"
    }
}

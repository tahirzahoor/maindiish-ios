//
//  CommentTablewViewCellTableViewCell.swift
//  maindiish-ios
//
//  Created by Faizan Tanveer on 14/12/2023.
//

import UIKit

class CommentTablewViewCellTableViewCell: UITableViewCell {

    // MARK: - Outlets
    
    @IBOutlet weak var highlightedImageView: UIImageView!
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var commentTimeElapsedLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var replyButton: UIButton!
    @IBOutlet weak var commentLikeButton: CellButton!
    
    // MARK: - Lifecycle Methods
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setFonts()
    }
    
    // MARK: - Private Methods
    
    private func setFonts() {
        nameLabel.font = Fonts.interMedium.font(11)
        descriptionLabel.font = Fonts.interMedium.font(10)
        
        let font = Fonts.interMedium.font(8)
        commentTimeElapsedLabel.font = font
    }
    
    // MARK: - Public Methods
    
    func configure(with data: Comment) {
        nameLabel.text = "Ali Tahir"
        descriptionLabel.text = data.description
        commentTimeElapsedLabel.text = data.commentTimeElapsed
    }
    
}

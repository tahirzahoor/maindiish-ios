//
//  CommentsView.swift
//  maindiish-ios
//
//  Created by Faizan Tanveer on 14/12/2023.
//

import UIKit

class CommentsView: UIView {

    // MARK: - Outlets
    
    @IBOutlet weak var draggerView: UIView!
    @IBOutlet weak var commentsLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var commentsBackgroundView: UIView!
    
    // MARK: - Lifecycle Methods
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setFonts()
        applyCorners()
    }
    
    // MARK: - Private Methods
    
    private func setFonts() {
        commentsLabel.font = Fonts.interMedium.font(14)
        searchTextField.font = Fonts.interSemibold.font(11)
    }
    
    private func applyCorners() {
        commentsBackgroundView.roundCorner([.layerMinXMinYCorner, .layerMaxXMinYCorner], radius: 40)
    }

}

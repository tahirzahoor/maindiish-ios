//
//  LikesView.swift
//  maindiish-ios
//
//  Created by Faizan Tanveer on 14/12/2023.
//

import UIKit

class LikesView: UIView {

    // MARK: - Outlets
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Lifecycle Methods
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setFonts()
    }
    
    // MARK: - Private Methods
    
    private func setFonts() {
        let font = Fonts.robotoRegular.font(15)
        titleLabel.font = font
        searchTextField.font = font
    }

}

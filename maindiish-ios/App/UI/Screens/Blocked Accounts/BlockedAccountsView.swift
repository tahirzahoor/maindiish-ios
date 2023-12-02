//
//  BlockedAccountsView.swift
//  maindiish-ios
//
//  Created by Faizan Tanveer on 02/12/2023.
//

import UIKit

class BlockedAccountsView: UIView {
    
    // MARK: - Outlets
    
    @IBOutlet weak var screenTitleLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Lifecycle Methods
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setFonts()
    }
    
    // MARK: - Private Methods
    
    private func setFonts() {
        screenTitleLabel.font = Fonts.robotoRegular.font(15)
    }
}

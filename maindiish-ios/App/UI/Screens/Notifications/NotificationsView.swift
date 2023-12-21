//
//  NotificationsView.swift
//  maindiish-ios
//
//  Created by Faizan Tanveer on 21/12/2023.
//

import UIKit

class NotificationsView: UIView {

    // MARK: - Outlets
    
    @IBOutlet weak var screenTitleLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Lifecycle Methods
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setFonts()
        tableView.separatorStyle = .none
    }
    
    // MARK: - Private Methods
    
    private func setFonts() {
        screenTitleLabel.font = Fonts.robotoRegular.font(15)
    }

}

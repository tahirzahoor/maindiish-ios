//
//  ProfileView.swift
//  maindiish-ios
//
//  Created by Faizan Tanveer on 20/11/2023.
//

import UIKit

class ProfileView: UIView {
    
    // MARK: - Outlets
    
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var displayImageView: UIImageView!
    @IBOutlet weak var profileNameLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var lovesLabel: UILabel!
    @IBOutlet weak var followersLabel: UILabel!
    @IBOutlet weak var followingLabel: UILabel!
    @IBOutlet weak var lovesCountLabel: UILabel!
    @IBOutlet weak var followersCountLabel: UILabel!
    @IBOutlet weak var followingsCountLabel: UILabel!
    @IBOutlet weak var followButton: RoundedButton!
    @IBOutlet weak var messageButton: RoundedButton!
    @IBOutlet weak var allLabel: UILabel!
    @IBOutlet weak var briefsLabel: UILabel!
    @IBOutlet weak var blogsLabel: UILabel!
    @IBOutlet weak var allTabIndicatorView: UIView!
    @IBOutlet weak var briefTabIndicatorView: UIView!
    @IBOutlet weak var blogsTabIndicatorView: UIView!
    @IBOutlet weak var contentView: UIView!
    
    @IBOutlet weak var allTabsView: UIView!
    @IBOutlet weak var briefsTabView: UIView!
    @IBOutlet weak var blogTabView: UIView!
    
    // MARK: - Lifecycle Methods
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setFonts()
    }
    
    // MARK: - Private Methods
    
    private func setFonts() {
        usernameLabel.font = Fonts.robotoRegular.font(15)
        profileNameLabel.font = Fonts.interMedium.font(22)
        statusLabel.font = Fonts.interRegular.font(12)
        
        let statsLabelfont = Fonts.interRegular.font(14)
        lovesLabel.font = statsLabelfont
        followersLabel.font = statsLabelfont
        followingLabel.font = statsLabelfont
        
        let statsFont = Fonts.poppinsSemibold.font(18)
        lovesCountLabel.font = statsFont
        followersCountLabel.font = statsFont
        followingsCountLabel.font = statsFont
        
        let buttonTextFont = Fonts.robotoMedium.font(14)
        followButton.titleLabel?.font = buttonTextFont
        messageButton.titleLabel?.font = buttonTextFont
    }
    
    // MARK: - Public Methods
    
    func setView(for tab: TabItem) {
        
        let selectedColor = UIColor.appThemeColor
        let unselectedColor = UIColor.gray
        
        allTabIndicatorView.isHidden = tab != .all
        blogsTabIndicatorView.isHidden = tab != .blogs
        briefTabIndicatorView.isHidden = tab != .briefs
        
        allLabel.textColor = tab == .all ? selectedColor : unselectedColor
        briefsLabel.textColor = tab == .briefs ? selectedColor : unselectedColor
        blogsLabel.textColor = tab == .blogs ? selectedColor : unselectedColor
    }
}

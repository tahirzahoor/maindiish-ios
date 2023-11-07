//
//  MainTabsView.swift
//  maindiish-ios
//
//  Created by Faizan Tanveer on 08/11/2023.
//

import UIKit

class MainTabsView: UIView {
    
    // MARK: - Outlets

    @IBOutlet weak var selectedTabView: UIView!
    @IBOutlet var tabButtons: [UIButton]!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setTabBarButtonImages()
        tabButtons[0].isSelected = true
    }
    
    func updateTabBarView(for selectedButton: UIButton) {
        for button in tabButtons {
            button.isSelected = button == selectedButton
        }
    }
    
    func setTabBarButtonImages() {
        guard tabButtons != nil else {
            return
        }
        tabButtons[0].setImage(UIImage(named: "explore_selected"), for: .selected)
        tabButtons[0].setImage(UIImage(named: "explore_unselected_themed"), for: .normal)
        tabButtons[1].setImage(UIImage(named: "trendings_selected"), for: .selected)
        tabButtons[1].setImage(UIImage(named: "trending_unselected_themed"), for: .normal)
    }
}

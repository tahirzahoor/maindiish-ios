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
        
        for button in tabButtons {
            let prefix = Tab.allCases[button.tag].rawValue
            let unselectedImageName = prefix + "_unselected_themed"
            let selectedImageName = prefix + "_selected"
            
            button.setImage(UIImage(named: selectedImageName), for: .selected)
            button.setImage(UIImage(named: unselectedImageName), for: .normal)
        }
        
    }
}

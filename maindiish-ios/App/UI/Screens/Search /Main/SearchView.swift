//
//  SearchView.swift
//  maindiish-ios
//
//  Created by Faizan Tanveer on 18/11/2023.
//

import UIKit

class SearchView: UIView {

    // MARK: - Outlets
    
    @IBOutlet weak var searchField: UITextField!
    @IBOutlet var searchFilterButtons: [RoundedButton]!
    @IBOutlet weak var filteredDataView: UIView!
    
    // MARK: - Lifecycle Methods
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setFonts()
        setButtonsView(for: .people)
    }
    
    // MARK: - Private Methods
    
    private func setFonts() {
        searchField.font = Fonts.robotoRegular.font(15)
        
        let font = Fonts.robotoMedium.font(12)
        searchFilterButtons.forEach { $0.titleLabel?.font = font }
    }
    
    // MARK: - Public Methods
    
    func setButtonsView(for filter: SearchFilter) {
        
        searchFilterButtons.forEach { button in
            let backgroundColor: UIColor = button.tag == filter.rawValue ? .appThemeColor : .cardBackground
            let textColor: UIColor = button.tag == filter.rawValue ? .white : .trendinsButtonText
            
            button.backgroundColor = backgroundColor
            button.setTitleColor(textColor, for: .normal)
        }
        
    }

}

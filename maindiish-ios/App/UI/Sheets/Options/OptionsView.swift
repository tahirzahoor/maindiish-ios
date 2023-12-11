//
//  OptionsView.swift
//  maindiish-ios
//
//  Created by Faizan Tanveer on 12/12/2023.
//

import UIKit

class OptionsView: UIView {

    // MARK: - Outlets
    
    @IBOutlet weak var optionsBackgroundView: UIView!
    @IBOutlet weak var draggerView: UIView!
    
    // MARK: - Lifecycle Methods
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        configureView()
    }
    
    // MARK: - Private Methods
    
    private func configureView() {
        optionsBackgroundView
            .roundCorner(
                [.layerMinXMinYCorner, .layerMaxXMinYCorner],
                radius: 40
            )
    }
    
}

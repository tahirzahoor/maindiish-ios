//
//  HomeView.swift
//  BaseCode
//
//  Created by Faizan Tanveer on 20/10/2023.
//

import UIKit

class HomeView: UIView {
    
    // MARK: - Outlets
    
    @IBOutlet weak var loginButton: RoundedButton!
    @IBOutlet weak var signupButton: RoundedButton!
    @IBOutlet weak var googleIntegrationButton: RoundedButton!
    
    // MARK: - Lifecycle Methods
    
    override func awakeFromNib() {
        setupButtons()
    }
    
    private func setupButtons() {
        
        let cornerRadius = loginButton.frame.height / 4
        
        loginButton.setView(title: GlobalStrings.Title.login, titleFont: .interSemibold, cornerRadius: cornerRadius )
        signupButton.setView(title: GlobalStrings.Title.signup, titleFont: .interSemibold, cornerRadius: cornerRadius)
        googleIntegrationButton.setView(backgroundColor: .white, title: "", cornerRadius: cornerRadius)
    }
}

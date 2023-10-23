//
//  LoginViewController.swift
//  BaseCode
//
//  Created by Faizan Tanveer on 20/10/2023.
//

import Foundation
import UIKit

class LoginViewController: ViewController<LoginViewModel> {
    
    // MARK: - Outlets
    
    @IBOutlet weak var loginView: LoginView!
    
    // MARK: - Lifecycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        includeHeader("Log In", delegate: self, fixIn: loginView.headerView)
    }
    
}

// MARK: - AuthenticationScreenHeaderViewDelegate Methods

extension LoginViewController: AuthenticationScreenHeaderViewDelegate {
    func didTapBackButton() {
        viewModel.router.pop(animated: true)
    }
}



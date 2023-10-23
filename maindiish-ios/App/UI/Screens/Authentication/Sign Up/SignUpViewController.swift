//
//  SignUpViewController.swift
//  BaseCode
//
//  Created by Faizan Tanveer on 22/10/2023.
//

import Foundation
import UIKit

class SignUpViewController: ViewController<SignUpViewModel> {
    
    // MARK: - Outlets
    
    @IBOutlet weak var signUpView: SignUpView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        includeHeader(
            GlobalStrings.Title.signUp,
            delegate: self,
            fixIn: signUpView.headerView
        )
    }
    
    @IBAction
    func nextButtonTapped(_ sender: RoundedButton) {
        viewModel.router.append(.createUsername, animated: true)
    }
}

extension SignUpViewController: AuthenticationScreenHeaderViewDelegate {
    func didTapBackButton() {
        viewModel.router.pop(animated: true)
    }
}

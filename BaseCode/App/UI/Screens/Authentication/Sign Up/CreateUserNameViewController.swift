//
//  CreateUserNameViewController.swift
//  BaseCode
//
//  Created by Faizan Tanveer on 22/10/2023.
//

import UIKit

class CreateUserNameViewController: ViewController<ViewModel> {

    // MARK: - Outlets
    
    @IBOutlet weak var createUserNameView: CreateUserNameView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        includeHeader("Sign Up", delegate: self, fixIn: createUserNameView.headerView)
    }
 
    // MARK: - Action Methods
    
    @IBAction func signUpButtonTapped(_ sender: RoundedButton) {
        viewModel.router.setRoot(.home)
        viewModel.router.append(.login, animated: false)
    }
}

// MARK: - AuthenticationScreenHeaderViewDelegate Methods
extension CreateUserNameViewController: AuthenticationScreenHeaderViewDelegate {
    func didTapBackButton() {
        viewModel.router.pop(animated: true)
    }
}

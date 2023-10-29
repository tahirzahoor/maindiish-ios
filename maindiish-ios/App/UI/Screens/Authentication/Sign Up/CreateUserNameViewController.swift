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
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
        title = "Sign Up"
    }
 
    // MARK: - Action Methods
    
    @IBAction
    func signUpButtonTapped(_ sender: RoundedButton) {
        viewModel.router.setRoot(.home)
        viewModel.router.append(.login, animated: false)
    }
    
    @IBAction
    func forgotPasswordButtonTapped(_ sender: UIButton) {
        viewModel.router.append(.forgotPassword, animated: true)
    }
    
}

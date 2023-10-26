//
//  LoginViewController.swift
//  BaseCode
//
//  Created by Faizan Tanveer on 20/10/2023.
//

import Foundation
import UIKit

class LoginViewController: ViewController<LoginViewModel> {
    
    // MARK: - Private Properties
    
    private let emailTextFieldTag = 1
    private let passwordTextFieldTag = 2
    
    // MARK: - Outlets
    
    @IBOutlet weak var loginView: LoginView!
    
    // MARK: - Lifecycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        title = "Log In"
        navigationController?.setNavigationBarHidden(false, animated: false)
    }
    
    // MARK: - Action Methods
    
    @IBAction
    func forgotPasswordButtonTapped(_ sender: UIButton) {
        
    }
    
    @IBAction
    func passwordVisibilityButtonTapped(_ sender: UIButton) {
        
        let isHidden = loginView.passwordInputField.isSecureTextEntry
        
        let image = isHidden ? AssetsImage.eyesOn.image : AssetsImage.eyesOff.image
        sender.setImage(image, for: .normal)
        
        loginView.passwordInputField.isSecureTextEntry.toggle()
    }
    
    
    @IBAction
    func loginButtonTapped(_ sender: RoundedButton) {
        viewModel.validate()
    }
    
    @IBAction
    func texttFieldEditingDidChange(_ sender: UITextField) {
        
        switch sender.tag {
            case emailTextFieldTag:
                viewModel.email = sender.text ?? ""
            case passwordTextFieldTag:
                viewModel.password = sender.text ?? ""
            default:
                break
        }
        
    }
    
}




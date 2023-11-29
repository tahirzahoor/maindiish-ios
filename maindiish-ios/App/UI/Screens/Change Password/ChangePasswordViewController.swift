//
//  ChangePasswordViewController.swift
//  maindiish-ios
//
//  Created by Faizan Tanveer on 29/11/2023.
//

import Foundation
import UIKit

class ChangePasswordViewController: ViewController<ChangePasswordViewModel> {
    
    // MARK: - Outlets
    
    @IBOutlet weak var changePasswordView: ChangePasswordView!
    
    // MARK: - Lifecycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setBindings()
    }
    
    // MARK: - Action Methods
    
    @IBAction
    func backButtonTapped(_ sender: UIButton) {
        viewModel.router.pop(animated: true)
    }
    
    @IBAction
    func fieldEditingDidChange(_ sender: UITextField) {
        guard let index = changePasswordView.textfields.firstIndex(of: sender) else { return }
        
        let field = ChangePasswordField.allCases[index]
        let text = sender.text ?? ""
        viewModel.update(valueFor: field, withText: text)
    }
    
    @IBAction
    func verifyButtonTapped(_ sender: UIButton) {
        viewModel.verifyInputs()
    }
    
    @IBAction
    func goHomeButtonTapped(_ sender: Any) {
        viewModel.router.setRoot(.mainTab)
    }
    
    // MARK: - Private Methods
    
    private func setBindings() {
        viewModel
            .$inputsAreValid
            .sink { areValid in
                self.changePasswordView.passwordChangedSuccessView.isHidden = !areValid
            }
            .store(in: &bag)
    }

}

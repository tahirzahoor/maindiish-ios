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
        includeHeader("Sign Up", delegate: self, fixIn: signUpView.headerView)
    }
    
    @IBAction
    func nextButtonTapped(_ sender: RoundedButton) {
        viewModel.router.append(.createUsername, animated: true)
    }
}

extension SignUpViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.formData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let data = viewModel.formData[indexPath.row]
        
        switch data.cellType {
            case .singleTextFieldCell:
                let cell: SingleTextFieldTableViewCell = tableView.dequeueCell(for: indexPath)
                cell.fieldNameLabel.text = data.field.fieldName
                cell.inputField.placeholder = data.field.placeHolder
                
                return cell
            
            case .dropDownFieldCell:
                let cell: DropDownSelectionTableViewCell = tableView.dequeueCell(for: indexPath)
                cell.fieldNameLabel.text = data.field.fieldName
                cell.inputField.placeholder = data.field.placeHolder
                cell.inputField.keyboardType = .phonePad
                cell.dropDownSelectedLabel.text = "USA"
                
                return cell
            
            case .secureFieldCell:
                let cell: SecureTextFieldTableViewCell = tableView.dequeueCell(for: indexPath)
                cell.fieldNameLabel.text = data.field.fieldName
                cell.inputField.placeholder = data.field.placeHolder
                
                return cell
        }
    }
}

extension SignUpViewController: AuthenticationScreenHeaderViewDelegate {
    func didTapBackButton() {
        viewModel.router.pop(animated: true)
    }
}

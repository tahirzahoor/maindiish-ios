//
//  TypeCodeViewController.swift
//  maindiish-ios
//
//  Created by Faizan Tanveer on 29/10/2023.
//

import Foundation
import UIKit

class TypeCodeViewController: ViewController<TypeCodeViewModel> {
    
    // MARK: - Outlets
    
    @IBOutlet weak var typeCodeView: TypeCodeView!
    
    // MARK: - Action Methods
    
    @IBAction 
    func resendButtonTapped(_ sender: UIButton) {
        // MARK: - API Required
    }
    
    // MARK: - Private Methods
    
    private func allFieldsAreFilled() -> Bool {
        for tag in 1..<7 {
            if let field = view.viewWithTag(tag) as? UITextField, let text = field.text, text.isEmpty {
                return false
            }
        }
        
        return true
    }
    
}

// MARK: - UITextFieldDelegate Methods

extension TypeCodeViewController: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        guard let text = textField.text as? NSString else {
            return false
        }
        
        let updatedText = text.replacingCharacters(in: range, with: string)
        
        if updatedText.isEmpty {
            textField.text = updatedText
            if let previousTextField = view.viewWithTag(textField.tag - 1) as? UITextField {
                    previousTextField.becomeFirstResponder()
            }
        }
        
        if updatedText.count == 1 {
            textField.text = updatedText
            if let textField = view.viewWithTag(textField.tag + 1) as? UITextField {
                textField.becomeFirstResponder()
            }
        }
        
        if allFieldsAreFilled() {
            viewModel.isLoading = true
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                self.viewModel.isLoading = false
                self.viewModel.router.append(.setNewPassword, animated: true)
            }
        }
        
        return false
    }
}

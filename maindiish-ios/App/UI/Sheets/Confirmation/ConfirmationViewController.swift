//
//  ConfirmationViewController.swift
//  maindiish-ios
//
//  Created by Faizan Tanveer on 14/12/2023.
//

import Foundation
import UIKit

class ConfirmationViewController: ViewController<ConfirmationViewModel> {
    
    // MARK: - Outlets
    
    @IBOutlet weak var confirmationView: ConfirmationView!
    
    // MARK: - Lifecycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addGesture()
        confirmationView.configureView(with: viewModel.config.viewConfig)
    }
    
    // MARK: - Action Methods
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        let isBlockButton = sender.titleLabel?.text?.lowercased() == "block"
        
        if isBlockButton {
            confirmationView.buttonsView.isHidden = isBlockButton
            confirmationView.blockSuccessView.isHidden = !isBlockButton
            
            let attributedString = NSMutableAttributedString(string: "MH. Jessile")
            let attributes: [NSAttributedString.Key: Any] = [
                .foregroundColor: UIColor.appThemeColor
            ]
            attributedString.addAttributes(attributes, range: ("MH. Jessile" as NSString).range(of: "MH. Jessile"))
            attributedString.append(NSAttributedString(string: " has been blocked"))
            
            confirmationView.blockSuccessLabell.attributedText = attributedString
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                self.dismissView()
            }
        } else {
            dismiss(animated: true) {
                self.viewModel.performAction(for: sender.tag)
            }
        }
    }
    
    // MARK: - Private Methods
    
    private func addGesture() {
        let gesture = UITapGestureRecognizer(target: self, action: #selector(dismissView))
        confirmationView.backgroundView.addGestureRecognizer(gesture)
    }
    
    @objc
    private func dismissView() {
        dismiss(animated: true)
    }
    
}

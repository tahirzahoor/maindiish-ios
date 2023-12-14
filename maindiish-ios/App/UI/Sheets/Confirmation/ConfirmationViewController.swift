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
        dismiss(animated: true) {
            self.viewModel.performAction(for: sender.tag)
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

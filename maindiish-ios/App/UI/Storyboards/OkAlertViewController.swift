//
//  OkAlertViewController.swift
//  maindiish-ios
//
//  Created by Faizan Tanveer on 26/10/2023.
//

import Foundation

class OkAlertViewController: ViewController<AlertViewModel> {
    
    @IBOutlet weak var alertView: OkAlertView!
    
    @IBAction
    func okButtonAction(_ sender: RoundedButton) {
        dismiss(animated: true)
    }
    
    // MARK: - Lifecycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        alertView.setData(title: viewModel.title, message: viewModel.message)
    }
    
}

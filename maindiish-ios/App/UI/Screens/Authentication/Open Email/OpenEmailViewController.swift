//
//  OpenEmailViewController.swift
//  maindiish-ios
//
//  Created by Faizan Tanveer on 29/10/2023.
//

import Foundation

class OpenEmailViewController: ViewController<OpenEmailViewModel> {
    
    // MARK: - Outlets
    
    @IBOutlet weak var openEmailView: OpenEmailView!
    
    // MARK: - Lifecycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    // MARK: - Action Methods
    
    @IBAction
    func openEmailButtonTapped(_ sender: RoundedButton) {
        
    }
    
    @IBAction
    func backButtonTapped(_ sender: RoundedButton) {
        viewModel.router.pop(animated: true)
    }
    
}

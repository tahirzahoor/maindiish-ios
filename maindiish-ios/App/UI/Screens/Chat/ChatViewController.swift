//
//  ChatViewController.swift
//  maindiish-ios
//
//  Created by Faizan Tanveer on 05/12/2023.
//

import Foundation
import UIKit

class ChatViewController: ViewController<ChatViewModel> {
    
    // MARK: - Outlets
    
    @IBOutlet weak var chatView: ChatView!
    
    // MARK: - Lifecycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        chatView.chatterNameLabel.text = viewModel.user.name
    }
    
    // MARK: - Action Methods
    
    @IBAction
    func backButtonTapped(_ sender: UIButton) {
        viewModel.router.pop(animated: true)
    }
    
    @IBAction
    func pickPhoneMediaButtonTapped(_ sender: UIButton) {
        
    }
    
    @IBAction
    func sendButtontapped(_ sender: UIButton) {
        chatView.messageInputField.text = ""
    }
    
    // MARK: - Private Methods
    
}


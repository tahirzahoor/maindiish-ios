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
        chatView.tableView.scrollToRow(at: IndexPath(row: 0, section: 0), at: .middle, animated: true)
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

extension ChatViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let image = UIImage(named: "dum")
        
        return image?.size.height ?? 1000
    }
}

extension ChatViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: ChatTableViewCell = tableView.dequeueCell(for: indexPath)
        
        let image = UIImage(named: "dum")
        cell.senderProfileImageView.image = image
        
        return cell
    }
}


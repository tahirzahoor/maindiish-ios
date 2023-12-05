//
//  ChatListingViewController.swift
//  maindiish-ios
//
//  Created by Faizan Tanveer on 05/12/2023.
//

import Foundation
import UIKit

class ChatListingViewController: ViewController<ChatListingViewModel> {
    
    // MARK: - Outlets
    
    @IBOutlet weak var chatListingView: ChatListingView!
    
    // MARK: - Action Methods
    
    @IBAction
    func searchEditingDidChange(_ sender: UITextField) {
        viewModel.searchText = sender.text ?? ""
        updateView()
    }
    
    // MARK: - Lifecycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateView()
    }
    
    // MARK: - Private Methods
    
    private func updateView() {
        let chatIsEmpty = viewModel.filteredChats.isEmpty
        chatListingView.emptyInboxView.isHidden = !chatIsEmpty
        chatListingView.tableView.isHidden = chatIsEmpty
        chatListingView.tableView.reloadData()
    }

}

// MARK: - UITableViewDelegate Methods

extension ChatListingViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        84
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let view = UIView()
        view.backgroundColor = .clear
        view.frame.size.height = 140
        
        return view
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.selectionStyle = .none
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let user = User(name: "New User")
        viewModel.router.append(.chat(user), animated: true)
    }
}

// MARK: - UITableViewDataSource Methods

extension ChatListingViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.filteredChats.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: ChatListingTableViewCell = tableView.dequeueCell(for: indexPath)
        
        let data = viewModel.filteredChats[indexPath.row]
        cell.configure(with: data)
        
        return cell
    }
}

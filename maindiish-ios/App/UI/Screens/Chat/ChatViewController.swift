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
        UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView()
        view.backgroundColor = .clear
        
        let label = UILabel()
        label.textColor = UIColor(red: 0.267, green: 0.278, blue: 0.306, alpha: 1)
        label.font = Fonts.robotoRegular.font(12.5)
        label.text = viewModel.cellData[section].timeString
        
        view.addSubview(label)
    
        label.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])

        return view
    }

    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        38
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let sectionHeaderHeight: CGFloat = 38
        let offset = scrollView.contentOffset.y
    
        chatView.tableView.sectionHeaderTopPadding = max(0, -offset)
    }
}

extension ChatViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        viewModel.cellData.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.cellData[section].cells.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let data = viewModel.cellData[indexPath.section].cells[indexPath.row]
        
        switch data.cellType {
            case .send:
                let cell: SendMessageTableViewCell = tableView.dequeueCell(for: indexPath)
                cell.configure(with: data)
                return cell
            
            case .received:
                let cell: ReceivedMessageTableViewCell = tableView.dequeueCell(for: indexPath)
                cell.configure(with: data)
                return cell
            
            case .sendImage:
                let cell: SendImageTableViewCell = tableView.dequeueCell(for: indexPath)
                cell.configure(with: data)
                return cell
            
            case .receiveImage:
                let cell: ReceivedImageTableViewCell = tableView.dequeueCell(for: indexPath)
                cell.configure(with: data)
                return cell
            
            case .sendLink:
                let cell: SendLinkTableViewCell = tableView.dequeueCell(for: indexPath)
                cell.configure(with: data)
                return cell
            
            case .receiveLink:
                let cell: ReceiveLinkTableViewCell = tableView.dequeueCell(for: indexPath)
                cell.configure(with: data)
                return cell
        }
    
    }
}


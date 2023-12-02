//
//  BlockedAccountsViewController.swift
//  maindiish-ios
//
//  Created by Faizan Tanveer on 02/12/2023.
//

import Foundation
import UIKit

class BlockedAccountsViewController: ViewController<BlockedAccountsViewModel> {
    
    // MARK: - Outlets
    
    @IBOutlet weak var blockedAccountsView: BlockedAccountsView!
    
    // MARK: - Lifecycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        registerTableViewCells()
    }
    
    // MARK: - Action Methods
    
    @IBAction
    func backButtonTapped(_ sender: UIButton) {
        viewModel.router.pop(animated: true)
    }
    
    // MARK: - Private Methods
    
    private func registerTableViewCells() {
        let nib = UINib(nibName: "UserTableViewCell", bundle: nil)
        blockedAccountsView
            .tableView
            .register(
                nib,
                forCellReuseIdentifier: "UserTableViewCell"
            )
    }

}

// MARK: - UITableViewDelegate Methods

extension BlockedAccountsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.openProfile(forUserAt: indexPath.row)
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.selectionStyle = .none
    }
}

// MARK: - UITableViewDataSource Methods

extension BlockedAccountsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.blockedUsers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UserTableViewCell = tableView.dequeueCell(for: indexPath)
        
        let user = viewModel.blockedUsers[indexPath.row]
        cell.setData(of: user)
        
        return cell
    }
}

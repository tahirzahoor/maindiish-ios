//
//  LikesViewController.swift
//  maindiish-ios
//
//  Created by Faizan Tanveer on 14/12/2023.
//

import Foundation
import UIKit

class LikesViewController: ViewController<LikesViewModel> {
    
    // MARK: - Outlets
    
    @IBOutlet weak var likesView: LikesView!
    
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
    
    @IBAction
    func searchFieldEditingChanged(_ sender: UITextField) {
        viewModel.searchedQuery = sender.text ?? ""
        likesView.tableView.reloadData()
    }
    
    // MARK: - Private Methods
    
    private func registerTableViewCells() {
        let nib = UINib(nibName: "UserTableViewCell", bundle: nil)
        likesView
            .tableView
            .register(
                nib,
                forCellReuseIdentifier: "UserTableViewCell"
            )
    }

}

// MARK: - UITableViewDelegate Methods

extension LikesViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.openProfile(forUserAt: indexPath.row)
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.selectionStyle = .none
    }
}

// MARK: - UITableViewDataSource Methods

extension LikesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.searchFilteredUsers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UserTableViewCell = tableView.dequeueCell(for: indexPath)
        
        let user = viewModel.searchFilteredUsers[indexPath.row]
        cell.setData(of: user)
        cell.followButton.isHidden = false
        
        return cell
    }
}



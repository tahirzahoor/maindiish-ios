//
//  SearchedPeopleViewController.swift
//  maindiish-ios
//
//  Created by Faizan Tanveer on 18/11/2023.
//

import Foundation
import UIKit

class SearchedPeopleViewController: ViewController<SearchedPeopleViewModel> {
 
    // MARK: - Outlets
    
    @IBOutlet weak var searchedPeopleView: SearchedPeopleView!

}

extension SearchedPeopleViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        // MARK: - Open Profile
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        (cell as! SearchedPeopleCell).highlightIndicatorImageView.isHidden = true
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        50
    }
}

extension SearchedPeopleViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.filteredUsers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: SearchedPeopleCell = tableView.dequeueCell(for: indexPath)
        
        let user = viewModel.filteredUsers[indexPath.row]
        cell.configureCell(withDataOf: user)
        
        return cell
    }
}

extension SearchedPeopleViewController: SearchDelegate {
    func filterData(for query: String) {
        viewModel.searchedQuery = query
        searchedPeopleView.peopleTableView.reloadData()
    }
}

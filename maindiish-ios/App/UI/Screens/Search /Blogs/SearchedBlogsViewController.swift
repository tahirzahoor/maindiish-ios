//
//  SearchedBlogsViewController.swift
//  maindiish-ios
//
//  Created by Faizan Tanveer on 18/11/2023.
//

import Foundation
import UIKit

class SearchedBlogsViewController: ViewController<SearchedBlogsViewModel> {
    
    // MARK: - Outlets
    
    @IBOutlet weak var searchedBlogsView: SearchedBlogsView!
    
    // MARK: -  Private Properties
    
    private let refreshControl = UIRefreshControl()
    
    // MARK: - Private Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        refreshControl.addTarget(self, action: #selector(refreshBlogs), for: .valueChanged)
        searchedBlogsView.blogsTableView.refreshControl = refreshControl
    }

    @objc
    private func refreshBlogs() {
        viewModel.addData()
        searchedBlogsView.blogsTableView.reloadData()
        refreshControl.endRefreshing()
    }
}

extension SearchedBlogsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let data = viewModel.filteredData[indexPath.row]
        
        viewModel.router.append(.postDetail(data: data), animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        UITableView.automaticDimension
    }
    
}

extension SearchedBlogsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.filteredData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: SearchedBlogsTableViewCell = tableView.dequeueCell(for: indexPath)
        
        let data = viewModel.filteredData[indexPath.row]
        cell.setData(data)
        
        return cell
    }
}

extension SearchedBlogsViewController: SearchDelegate {
    func filterData(for query: String) {
        viewModel.searchQuery = query
        searchedBlogsView.blogsTableView.reloadData()
    }
}

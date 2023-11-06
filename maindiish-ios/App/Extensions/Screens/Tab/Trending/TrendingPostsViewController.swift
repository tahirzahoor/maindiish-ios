//
//  TrendingPostsViewController.swift
//  maindiish-ios
//
//  Created by Faizan Tanveer on 07/11/2023.
//

import Foundation
import UIKit

class TrendingPostsViewController: ViewController<TrendingPostsViewModel> {
    
    // MARK: - Outlets
    
    @IBOutlet weak var trendingPostsView: TrendingPostsView!
    
    // MARK: - Lifecycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}

// MARK: - UITableViewDelegate Methods
extension TrendingPostsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }
}

// MARK: - UITableViewDataSource Methods
extension TrendingPostsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: TrendingPostTableViewCell = tableView.dequeueCell(for: indexPath)
        
        let data = viewModel.posts[indexPath.row]
        
        cell.configure(with: data)
        
        return cell
    }
}

// MARK: - UITableViewDelegate Methods
extension TrendingPostsViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath)
        
    }
}

// MARK: - UITableViewDataSource Methods
extension TrendingPostsViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView.tag == -1 {
            viewModel.filters.count
        } else {
            viewModel.posts[collectionView.tag].mediaImageNames?.count ?? 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView.tag == -1 {
            let cell: FilterCollectionViewCell = collectionView.dequeueCell(for: indexPath)
            
            let filterName = viewModel.filters[indexPath.item]
            cell.filterLabel.text = filterName
            
            return cell
            
        } else {
            let cell: TrendingPostImageCollectionViewCell = collectionView.dequeueCell(for: indexPath)
            
            let imageName = viewModel.posts[collectionView.tag].mediaImageNames?[indexPath.item] ?? ""
            let image = UIImage(named: imageName)
            cell.postImageView.image = image
            
            return cell
        }
    }
}

//
//  TrendingPostsViewController.swift
//  maindiish-ios
//
//  Created by Faizan Tanveer on 07/11/2023.
//

import Foundation
import UIKit

class TrendingPostsViewController: ViewController<TrendingPostsViewModel> {
    
    // MARK: - Private properties
    
    private var selectedFilterIndex: Int = 0
    
    // MARK: - Outlets
    
    @IBOutlet weak var trendingPostsView: TrendingPostsView!
    
    // MARK: - Lifecycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Action Methods
    
    @IBAction
    func followButtonTapped(_ sender: RoundedButton) {
        sender.isSelected.toggle()
        
        let title = sender.isSelected ? "Unfollow" : "Follow"
        sender.setTitle(title, for: .normal)
    }
    
}

// MARK: - UITableViewDelegate Methods
extension TrendingPostsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let data = viewModel.posts[indexPath.row]
        
        viewModel.router.append(.postDetail(data: data), animated: true)
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.selectionStyle = .none
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
        cell.mediaCollectionView.tag = indexPath.row
        
        return cell
    }
}

// MARK: - UICollectionViewDataSource Methods
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
            
            cell.setSelection(indexPath.row == selectedFilterIndex)
            
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

extension TrendingPostsViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectedFilterIndex = indexPath.row
        collectionView.reloadData()
    }
}

extension TrendingPostsViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cell: FilterCollectionViewCell = collectionView.dequeueCell(for: indexPath)
        
        let text = viewModel.filters[indexPath.row]
        cell.filterLabel.text = text
        
        let labelWidth = cell.filterLabel.sizeThatFits(CGSize(width: CGFloat.greatestFiniteMagnitude, height: cell.filterLabel.frame.height)).width
        
        let cellWidth = labelWidth + 40
        
        return CGSize(width: cellWidth, height: 40)
    }
}



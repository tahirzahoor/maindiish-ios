//
//  BriefCollectionViewController.swift
//  maindiish-ios
//
//  Created by Faizan Tanveer on 18/11/2023.
//

import Foundation
import UIKit

class BriefCollectionViewController: ViewController<BriefCollectionViewModel> {
    
    // MARK: - Outlets
    @IBOutlet weak var briefCollectionView: BriefCollectionView!
    
    // MARK: - Private Properties
    
    private let refreshControl = UIRefreshControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        setupCollectionView()
    }
    
    // MARK: - Private Methods
    
    private func setupCollectionView() {
        briefCollectionView.briefCollectionView.collectionViewLayout = BriefCollectionViewLayout.createLayout()
        
        refreshControl.addTarget(self, action: #selector(refreshCollection), for: .valueChanged)
        
        briefCollectionView.briefCollectionView.refreshControl = refreshControl
    }
    
    @objc
    private func refreshCollection() {
        viewModel.addData()
        briefCollectionView.briefCollectionView.reloadData()
        refreshControl.endRefreshing()
    }
    
}

extension BriefCollectionViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // Show Briefs Video
    }
}

extension BriefCollectionViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: BriefCollectionViewCell = collectionView.dequeueCell(for: indexPath)
        
        let data = viewModel.filteredBriefs[indexPath.item]
        cell.viewsCountLabel.text = "\(data.formattedCount)"
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.filteredBriefs.count
    }
}

extension BriefCollectionViewController: SearchDelegate {
    func filterData(for query: String) {
        viewModel.searchQuery = query
        briefCollectionView.briefCollectionView.reloadData()
    }
}


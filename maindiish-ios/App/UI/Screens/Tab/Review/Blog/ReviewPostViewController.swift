//
//  ReviewPostViewController.swift
//  maindiish-ios
//
//  Created by Faizan Tanveer on 10/11/2023.
//

import Foundation
import UIKit

class ReviewPostViewController: ViewController<ReviewPostViewModel> {
 
    // MARK: - Outlets
    
    @IBOutlet weak var reviewPostView: ReviewPostView!
    
    // MARK: - Lifecycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        reviewPostView.imagesPageControl.numberOfPages = viewModel.postData.imagesData.count
        reviewPostView.setView(with: viewModel.postData)
    }
    
    // MARK: - Action Methods
    
    @IBAction
    func backButtonTapped(_ sender: UIButton) {
        viewModel.router.pop(animated: true)
    }
    
    @IBAction
    func publishButtonTapped(_ sender: RoundedButton) {
        viewModel.publish()
    }
    
    @IBAction
    func pageControlValueChanged(_ sender: UIPageControl) {
        let index = sender.currentPage
        reviewPostView.imagesCollectionView.scrollToItem(at: IndexPath(row: index, section: 0), at: .centeredHorizontally, animated: true)
    }
    
}

// MARK: - UICollectionViewDataSource Methods

extension ReviewPostViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.postData.imagesData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: ReviewPostImageCollectionViewCell = collectionView.dequeueCell(for: indexPath)
        
        let imageData = viewModel.postData.imagesData[indexPath.row]
        let image = UIImage(data: imageData)
        cell.imageView.image = image
        
        return cell
    }
}

// MARK: - UICollectionViewDelegateFlowLayout Methods

extension ReviewPostViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        reviewPostView.imagesCollectionView.bounds.size
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        .zero
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        .zero
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        reviewPostView.imagesPageControl.currentPage = Int(scrollView.contentOffset.x) / Int(scrollView.frame.width)
    }
}

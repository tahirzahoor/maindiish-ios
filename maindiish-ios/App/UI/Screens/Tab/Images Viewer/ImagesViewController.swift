import Foundation
import UIKit

class ImagesViewController: ViewController<ImagesViewModel> {
    
    // MARK: - Outlets
    @IBOutlet weak var imagesView: ImagesView!
    
    // MARK: - Lifecycle Methods
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let scrollIndexPath = IndexPath(row: viewModel.selectedItemIndex, section: 0)
        imagesView.imagesCollectionView.scrollToItem(at: scrollIndexPath, at: .centeredHorizontally, animated: false)
    }
    
    // MARK: - Action Methods
    
    @IBAction
    func crossButtonTapped(_ sender: UIButton) {
        dismiss(animated: true)
    }
}

// MARK: - UICollectionViewDelegateFlowLayout Methods

extension ImagesViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let bounds = imagesView.imagesCollectionView.bounds
        
        return CGSize(width: bounds.width, height: bounds.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        .zero
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        .zero
    }
}

// MARK: - UICollectionViewDataSource Methods

extension ImagesViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.imagesData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: ReviewPostImageCollectionViewCell = collectionView.dequeueCell(for: indexPath)
        
        let imageData = viewModel.imagesData[indexPath.row]
        let image = UIImage(data: imageData)
        cell.imageView.image = image
        
        return cell
    }

}

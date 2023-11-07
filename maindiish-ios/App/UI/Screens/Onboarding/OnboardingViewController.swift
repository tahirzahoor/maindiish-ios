import Foundation
import UIKit

class OnboardingViewController: ViewController<OnboardingViewModel> {
    
    // MARK: - Outlets
    
    @IBOutlet weak var onboardingView: OnboardingView!
    
    // MARK: - Action Methods
    
    @IBAction
    func pageControlValueChanged(_ sender: UIPageControl) {
        let detail = viewModel.onboardings[sender.currentPage]
        
        onboardingView.updateView(for: sender.currentPage, with: detail)
    }
    
    @IBAction
    func nextButtonAction(_ sender: UIButton) {
        let nextPage = onboardingView.pageControl.currentPage + 1
        let detail = viewModel.onboardings[nextPage]
        
        onboardingView.updateView(for: nextPage, with: detail)
    }
    
    @IBAction
    func letsGoButtonAction(_ sender: RoundedButton) {
        viewModel.router.append(.home, animated: true)
    }
    
    @IBAction
    func skipButtonAction(_ sender: UIButton) {
        viewModel.router.append(.home, animated: true)
    }
    
    // MARK: - Lifecycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Instance Methods
   
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        
        onboardingView.setSkipButtonView()
    }
        
}

extension OnboardingViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.onboardings.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: OnboardingCollectionViewCell = collectionView.dequeueCell(for: indexPath)
    
        let onboardingDetail = viewModel.onboardings[indexPath.row]
        cell.configureCell(with: onboardingDetail)
        
        return cell
    }
}

extension OnboardingViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,
                            sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        .zero
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        .zero
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        .zero
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let currentPage = Int(scrollView.contentOffset.x) / Int(scrollView.frame.width)
        let detail = viewModel.onboardings[currentPage]
        
        onboardingView.updateView(for: currentPage, with: detail)
    }
    
}

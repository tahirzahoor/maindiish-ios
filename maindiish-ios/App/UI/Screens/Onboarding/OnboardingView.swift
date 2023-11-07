import UIKit

class OnboardingView: UIView {
    
    // MARK: - Outlets
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var skipButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var letsGoButton: RoundedButton!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    // MARK: - Lifecycle Methods
    
    override func awakeFromNib() {
        updatePageControlView()
        setSkipButtonView()
        setFonts()
        
        letsGoButton.setView(
            title: GlobalStrings.Title.onboardingLetsGo,
            titleFont: .robotoSemibold
        )
    }
    
    // MARK: - Public Methods
    
    func updateView(for page: Int, with data: OnboardingDetail) {
        hideSkipButton(page != 0)
        updateBottomButtonView(for: page)
        pageControl.currentPage = page
        scrollTo(page)
        updatePageControlView()
        titleLabel.text = data.title
        descriptionLabel.text = data.description
    }
    
    // MARK: - Private Methods
    
    private func updatePageControlView() {

        for page in 0..<pageControl.numberOfPages {
            let isCurrentPage = (page == pageControl.currentPage)
            let image = isCurrentPage ? AssetsImage.onboardingCurrentPageIndicator.image : AssetsImage.onboardingNonSelectedIndicator.image
            
            pageControl.setIndicatorImage(image, forPage: page)
        }
        
    }
    
    private func scrollTo(_ currentPage: Int) {
        let indexPath = IndexPath(
            row: currentPage,
            section: 0
        )
        collectionView.scrollToItem(
            at: indexPath,
            at: .centeredHorizontally,
            animated: true
        )
    }
    
    private func hideSkipButton(_ hide: Bool) {
        skipButton.isHidden = hide
    }
    
    private func updateBottomButtonView(for page: Int) {
        
        let isLastPage = (page == 2)
        
        nextButton.isHidden = isLastPage
        letsGoButton.isHidden = !isLastPage
    }
    
    func setSkipButtonView() {
        skipButton.layer.borderWidth = 1
        skipButton.layer.borderColor = UIColor.onboardingTitleLabel .withAlphaComponent(0.4).cgColor
        skipButton.layer.cornerRadius = 16.0
        skipButton.titleLabel?.font = Fonts.workSansSemibold.font(14)
    }
    
    func setFonts() {
        titleLabel.font = Fonts.poppinsSemibold.font(26)
        descriptionLabel.font = Fonts.workSansMedium.font(14)
    }

}

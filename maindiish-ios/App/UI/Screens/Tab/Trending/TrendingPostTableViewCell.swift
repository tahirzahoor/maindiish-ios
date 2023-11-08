import UIKit

class TrendingPostTableViewCell: UITableViewCell {

    // MARK: - Outlets
    
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var timeAgoLabel: UILabel!
    @IBOutlet weak var followButton: RoundedButton!
    @IBOutlet weak var moreOptionsButton: UIButton!
    @IBOutlet weak var postDescriptionLabel: UILabel!
    @IBOutlet weak var mediaCollectionView: UICollectionView!
    @IBOutlet weak var mediaPageControl: UIPageControl!
    @IBOutlet weak var numberOfHeartsButton: UIButton!
    @IBOutlet weak var numberOfCommentsButton: UIButton!
    @IBOutlet weak var numberOfViewsButton: UIButton!
    @IBOutlet weak var numberOfSharesButton: UIButton!
    
    // MARK: - Lifecycle Methods
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setLabelFonts()
    }
    
    // MARK: - Action Methods
    
    @IBAction
    func pageControlDidChange(_ sender: UIPageControl) {
        let pageNo = sender.currentPage
        
        mediaCollectionView.scrollToItem(at: IndexPath(item: pageNo, section: 0), at: .centeredHorizontally, animated: true)
    }
    
    // MARK: - Private Methods
    
    private func setLabelFonts() {
        nameLabel.font = Fonts.robotoMedium.font(15)
        timeAgoLabel.font = Fonts.poppinsLight.font(11.5)
        followButton.titleLabel?.font = Fonts.robotoRegular.font(10)
        postDescriptionLabel.font = Fonts.robotoRegular.font(13)
        
        let font = Fonts.poppinsRegular.font(11.5)
        numberOfHeartsButton.titleLabel?.font = font
        numberOfCommentsButton.titleLabel?.font = font
        numberOfViewsButton.titleLabel?.font = font
        numberOfSharesButton.titleLabel?.font = font
    }
    
    // MARK: - Public Methods
    
    func configure(with data: TrendingPostData) {
        nameLabel.text = data.profileName
        timeAgoLabel.text = data.postedTimeAgo
        postDescriptionLabel.text = data.postDescription
        
        numberOfHeartsButton.setTitle(" \(data.numberOfHearts)", for: .normal)
        numberOfCommentsButton.setTitle(" \(data.numberOfComments)", for: .normal)
        numberOfViewsButton.setTitle(" \(data.numberOfViews)", for: .normal)
        numberOfSharesButton.setTitle(" \(data.numberOfShares)", for: .normal)
        
        mediaPageControl.numberOfPages = data.mediaImageNames.count
        
        mediaCollectionView.reloadData()
    }
    
}

extension TrendingPostTableViewCell: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
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
        let pageNo = scrollView.contentOffset.x / scrollView.frame.size.width
        
        mediaPageControl.currentPage = Int(pageNo)
    }
    
}

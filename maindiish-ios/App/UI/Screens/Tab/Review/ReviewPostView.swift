import UIKit

class ReviewPostView: UIView {

    // MARK: - Outlets
    
    @IBOutlet weak var screenTitleLabel: UILabel!
    @IBOutlet weak var imagesCollectionView: UICollectionView!
    @IBOutlet weak var imagesPageControl: UIPageControl!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var byOwnerLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var tagsLabel: UILabel!
    @IBOutlet weak var publishPostButton: RoundedButton!
    
    // MARK: - Lifecycle Methods
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setFonts()
    }
    
    // MARK: - Private Methods
    
    private func setFonts() {
        screenTitleLabel.font = Fonts.interMedium.font(16)
        titleLabel.font = Fonts.interMedium.font(20)
        byOwnerLabel.font = Fonts.interRegular.font(15)
        descriptionLabel.font = Fonts.interRegular.font(14)
        tagsLabel.font = Fonts.interItalic.font(12)
        publishPostButton.titleLabel?.font = Fonts.robotoMedium.font(15)
    }
    
    // MARK: - Public Methods
    
    func setView(with data: PostData) {
        titleLabel.text = data.title
        byOwnerLabel.text = data.byOwner
        descriptionLabel.text = data.description
        tagsLabel.text = data.tags
        
    }
    
}


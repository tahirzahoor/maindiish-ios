import UIKit

class PostTableViewCell: UITableViewCell {

    // MARK: - Outlets
    
    @IBOutlet weak var blueCircleImageView: UIImageView!
    @IBOutlet weak var displayPictureImageView: UIImageView!
    @IBOutlet weak var profileNameLabel: UILabel!
    @IBOutlet weak var postedTimeAgoLabel: UILabel!
    @IBOutlet weak var followButton: RoundedButton!
    @IBOutlet weak var moreOptionsButton: UIButton!
    @IBOutlet weak var postDescriptionLabel: UILabel!
    @IBOutlet weak var mediaView: UIView!
    @IBOutlet weak var numberOfHeartsButton: UIButton!
    @IBOutlet weak var numberOfCommentsButton: UIButton!
    @IBOutlet weak var numberOfViewsButton: UIButton!
    @IBOutlet weak var numberOfSharesButton: UIButton!
    
    // MARK: - Lifecycle Methods
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setLabelFonts()
    }
   
    // MARK: - Private Methods
    
    private func setLabelFonts() {
        profileNameLabel.font = Fonts.robotoMedium.font(15)
        postedTimeAgoLabel.font = Fonts.poppinsLight.font(11.5)
        followButton.titleLabel?.font = Fonts.robotoRegular.font(10)
        postDescriptionLabel.font = Fonts.interMedium.font(18)
        
        let font = Fonts.poppinsRegular.font(11.5)
        numberOfHeartsButton.titleLabel?.font = font
        numberOfCommentsButton.titleLabel?.font = font
        numberOfViewsButton.titleLabel?.font = font
        numberOfSharesButton.titleLabel?.font = font
    }
    
    func configure(with data: TrendingPostData) {
        displayPictureImageView.image = UIImage(named: data.profileImageName)
        profileNameLabel.text = data.profileName
        postDescriptionLabel.text = data.postDescription
        postedTimeAgoLabel.text = data.postedTimeAgo
        numberOfViewsButton.titleLabel?.text = "\(data.numberOfViews)"
        numberOfHeartsButton.titleLabel?.text = "\(data.numberOfHearts)"
        numberOfCommentsButton.titleLabel?.text = "\(data.numberOfComments)"
        numberOfSharesButton.titleLabel?.text = "\(data.numberOfShares)"
        setImages(withImageNames: data.mediaImageNames)
    }
    
    private func setImages(withImageNames names: [String]) {
        
        var images = [UIImage]()
    
        for name in names {
            let image = UIImage(named: name) ?? UIImage()
            images.append(image)
        }
        
        let numberOfImages = names.count
        
        var imagesView = UIView()
        
        if numberOfImages == 1 {
            let view = SingleImageView.loadFromNib()
            view.setImages(images: images)
            imagesView = view
        } else if numberOfImages == 2 {
            let view = TwoImagesView.loadFromNib()
            view.setImages(images: images)
            imagesView = view
        } else if numberOfImages == 3 {
            let view = ThreeImagesView.loadFromNib()
            view.setImages(images: images)
            imagesView = view
        } else if numberOfImages >= 4 {
            let view = FourOrMoreImagesView.loadFromNib()
            view.setImages(images: images)
            imagesView = view
        }
        
        imagesView.fixInView(mediaView)
    }
    
}

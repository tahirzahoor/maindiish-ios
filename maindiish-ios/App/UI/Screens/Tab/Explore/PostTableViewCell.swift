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
    
    // MARK: - Private Properties
    
    private var longPressLikesGesture: UILongPressGestureRecognizer?
    
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
    
    func configure(with data: PostData) {
        displayPictureImageView.image = UIImage(named: "dummy_dp")
        profileNameLabel.text = data.owner
        postDescriptionLabel.text = data.description
        postedTimeAgoLabel.text = data.timeElapsedSincePosted
        numberOfHeartsButton.setTitle(" \(data.numberOfHearts)", for: .normal)
        numberOfCommentsButton.setTitle(" \(data.numberOfComments)", for: .normal)
        numberOfViewsButton.setTitle(" \(data.numberOfViews)", for: .normal)
        numberOfSharesButton.setTitle(" \(data.numberOfShares)", for: .normal)
        setImages(withImageData: data.imagesData)
    }
    
    private func setImages(withImageData data: [Data]) {
        
        let numberOfImages = data.count
        
        var imagesView = UIView()
        
        if numberOfImages == 1 {
            let view = SingleImageView.loadFromNib()
            view.setImages(imagesData: data)
            imagesView = view
        } else if numberOfImages == 2 {
            let view = TwoImagesView.loadFromNib()
            view.setImages(imagesData: data)
            imagesView = view
        } else if numberOfImages == 3 {
            let view = ThreeImagesView.loadFromNib()
            view.setImages(imagesData: data)
            imagesView = view
        } else if numberOfImages >= 4 {
            let view = FourOrMoreImagesView.loadFromNib()
            view.setImages(imagesData: data)
            imagesView = view
        }
        
        imagesView.fixInView(mediaView)
    }
    
    func addGesture(target: Any?, action: Selector) {
        if let longTapGesture = longPressLikesGesture {
            removeGestureRecognizer(longTapGesture)
        }
        
        longPressLikesGesture = UILongPressGestureRecognizer(target: target, action: action)
        longPressLikesGesture?.minimumPressDuration = 1
        
        numberOfHeartsButton.addGestureRecognizer(longPressLikesGesture!)
    }
    
    func setForProfile() {
        blueCircleImageView.isHidden = true
        displayPictureImageView.isHidden = true
        followButton.isHidden = true
        
        profileNameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20).isActive = true
    }
    
}

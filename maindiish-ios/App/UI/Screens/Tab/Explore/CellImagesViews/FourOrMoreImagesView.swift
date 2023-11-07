import UIKit

class FourOrMoreImagesView: UIView {

    // MARK: - Outlets
    
    @IBOutlet var imageViews: [UIImageView]!
    @IBOutlet weak var moreLabel: UILabel!
    
    // MARK: - Lifecycle Methods
    
    override func awakeFromNib() {
        super.awakeFromNib()
        moreLabel.font = Fonts.interMedium.font(10)
    }
    
    // MARK: - Public Methods
    
    func setImages(images: [UIImage]) {
        for (index, image) in images.enumerated() {
            imageViews[index].image = image
        }
    }
}

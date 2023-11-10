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
        for index in 0..<4 {
            imageViews[index].image = images[index]
        }
    }
    
    func setImages(imagesData: [Data]) {
        for index in 0..<4 {
            imageViews[index].image = UIImage(data: imagesData[index])
        }
    }
}

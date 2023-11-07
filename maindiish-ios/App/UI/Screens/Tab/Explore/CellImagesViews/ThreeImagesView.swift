import UIKit

class ThreeImagesView: UIView {

    // MARK: - Outlets
    
    @IBOutlet var imageViews: [UIImageView]!
    
    // MARK: - Public Methods
    
    func setImages(images: [UIImage]) {
        for (index, image) in images.enumerated() {
            imageViews[index].image = image
        }
    }
}

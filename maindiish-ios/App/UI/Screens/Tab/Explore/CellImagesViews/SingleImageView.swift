import UIKit

class SingleImageView: UIView {

    // MARK: - Outlets
    
    @IBOutlet weak var imageView: UIImageView!
    
    // MARK: - Public Methods
    
    func setImages(images: [UIImage]) {
        for image in images {
            imageView.image = image
        }
    }
    
    func setImages(imagesData: [Data]) {
        for data in imagesData {
            imageView.image = UIImage(data: data)
        }
    }
    
}

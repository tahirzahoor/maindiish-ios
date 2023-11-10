import UIKit

class PostImageTableViewCell: UITableViewCell {

    // MARK: - Outlets
    
    @IBOutlet weak var postImageView: UIImageView!
   
    func setImage(_ imageData: Data) {
        postImageView.image = UIImage(data: imageData)
    }

}

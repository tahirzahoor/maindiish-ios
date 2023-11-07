import UIKit

class PostImageTableViewCell: UITableViewCell {

    // MARK: - Outlets
    
    @IBOutlet weak var postImageView: UIImageView!
   
    func setImage(_ imageName: String) {
        postImageView.image = UIImage(named: imageName)
    }

}

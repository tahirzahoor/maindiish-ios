import UIKit

class PostDetailView: UIView {

    // MARK: - Outlets
    
    @IBOutlet weak var postOwnerNameLabel: UILabel!
    @IBOutlet weak var bottomView: UIView!
    @IBOutlet weak var textFieldOuterView: UIView!
    
    // MARK: - Lifecycle Methods
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setBorder()
    }
    
    // MARK: - Private Methods
    
    private func setBorder() {
        bottomView.roundCorner([.layerMinXMinYCorner, .layerMaxXMinYCorner], radius: 20)
    }
}

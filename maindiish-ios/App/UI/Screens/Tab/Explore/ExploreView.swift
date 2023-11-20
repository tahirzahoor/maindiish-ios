import UIKit

class ExploreView: UIView {

    // MARK: - Outlets
    
    @IBOutlet weak var postsTableView: UITableView!
    @IBOutlet weak var headerView: UIView!
    
    // MARK: - Lifecycle Methods
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
}

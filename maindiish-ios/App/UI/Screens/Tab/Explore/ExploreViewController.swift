import Foundation
import UIKit

class ExploreViewController: ViewController<ExploreViewModel> {
    
    // MARK: - Outlets
    
    @IBOutlet weak var exploreView: ExploreView!
    
    // MARK: - Lifecycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Action Methods
    
    @IBAction
    func followButtonTapped(_ sender: RoundedButton) {
        
        sender.isSelected.toggle()
        
        let title = sender.isSelected ? "unfollow" : "follow"
        
        sender.setTitle(title, for: .normal)
    }
    
    @IBAction
    func moreOptionsTapped(_ sender: UIButton) {
    }
    
    
    @IBAction
    func heartButtonTapped(_ sender: UIButton) {
        sender.isSelected.toggle()
        
        let title = sender.isSelected ? " 1" : " 0"
        sender.setTitle(title, for: .normal)
    }
    
    @IBAction
    func commentsButtonTapped(_ sender: UIButton) {
    }
    
    @IBAction
    func shareButtonTapped(_ sender: UIButton) {
    }
    
}

// MARK: - UITableViewDelegate Methods

extension ExploreViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let data = viewModel.data[indexPath.row]
        
        viewModel.router.append(.postDetail(data: data), animated: true)
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.selectionStyle = .none
    }

}

// MARK: - UITableViewDataSource Methods

extension ExploreViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: PostTableViewCell = tableView.dequeueCell(for: indexPath)
        
        let data = viewModel.data[indexPath.row]
        
        
        cell.followButton.tag = indexPath.row
        cell.moreOptionsButton.tag = indexPath.row
        cell.configure(with: data)
        
        var viewToFix: UIView
        
        let rem = indexPath.row % 4
        
        let image = UIImage(named: "dummy_post_image")!
        let images = Array<UIImage>(repeating: image, count: data.mediaImageNames?.count ?? 0)
        
        if rem == 0 {
            let view = SingleImageView.loadFromNib()
            view.setImages(images: images)
            viewToFix = view
        } else if rem == 1{
            let view = TwoImagesView.loadFromNib()
            view.setImages(images: images)
            viewToFix = view
        } else if rem == 2 {
            let view = ThreeImagesView.loadFromNib()
            view.setImages(images: images)
            viewToFix = view
        } else {
            let view = FourOrMoreImagesView.loadFromNib()
            view.setImages(images: images)
            viewToFix = view
        }
        
        viewToFix.fixInView(cell.mediaView)
        
        return cell
    }
    
}


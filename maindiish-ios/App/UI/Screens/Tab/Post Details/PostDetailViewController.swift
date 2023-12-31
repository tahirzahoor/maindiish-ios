import Foundation
import UIKit

class PostDetailViewController: ViewController<PostDetailViewModel> {
    
    // MARK: - Outlets
    
    @IBOutlet weak var postDetailView: PostDetailView!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true)
        
        postDetailView.postOwnerNameLabel.text = viewModel.data.owner + "'s post"
    }
    
    // MARK: - Action Methods
    
    @IBAction
    func backButtonTapped(_ sender: UIButton) {
        viewModel.router.pop(animated: true)
    }
    
}

extension PostDetailViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }
}

extension PostDetailViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.data.imagesData.count + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let data = viewModel.data
        
        if indexPath.row == 0 {
            let cell: PostTextDetailsTableViewCell = tableView.dequeueCell(for: indexPath)
            
            cell.configure(with: data)
            
            return cell
        } else {
            let cell: PostImageTableViewCell = tableView.dequeueCell(for: indexPath)
            
            let imageData = viewModel.data.imagesData[indexPath.row - 1]
            cell.setImage(imageData)
            
            return cell
        }
    }
    
}

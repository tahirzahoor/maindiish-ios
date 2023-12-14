//
//  CommentsViewController.swift
//  maindiish-ios
//
//  Created by Faizan Tanveer on 14/12/2023.
//

import Foundation
import UIKit

class CommentsViewController: ViewController<CommentsViewModel> {
    
    // MARK: - Outlets
    
    @IBOutlet weak var commentsView: CommentsView!
    
    // MARK: - Lifecycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addDragDownGesture(to: commentsView.commentsBackgroundView)
    }
    
    // MARK: - Action Methods
    
    @IBAction
    func sendButtonTapped(_ sender: UIButton) {
        guard let text = commentsView.searchTextField.text,  !text.isEmpty else { return }
        
        commentsView.searchTextField.text = ""
        
        let comment = Comment(
            description: text,
            commentTimeElapsed: "just now",
            numberOfLikes: 0
        )
        
        viewModel.comments.append(comment)
        CommentsRepository.shared.comments.append(comment)
        
        commentsView.tableView.reloadData()
        commentsView.tableView.scrollToRow(at: IndexPath(row: viewModel.comments.count - 1, section: 0), at: .bottom, animated: true)
    }
    
}

// MARK: - UITableViewDelegate Methods

extension CommentsViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }
    
}

// MARK: - UITableViewDataSource Methods

extension CommentsViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.comments.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: CommentTablewViewCellTableViewCell = tableView.dequeueCell(for: indexPath)
        
        let data = viewModel.comments[indexPath.row]
        cell.configure(with: data)
        
        return cell
    }
    
}





//
//  PostTypeBottomSheetViewController.swift
//  maindiish-ios
//
//  Created by Faizan Tanveer on 11/11/2023.
//

import Foundation
import UIKit

class PostTypeBottomSheetViewController: ViewController<PostTypeBottomSheetViewModel> {
    
    // MARK: - Outlets
    
    @IBOutlet weak var sheetView: PostTypeBottomSheetView!
    
    // MARK: - Lifecycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Action Methods
    
    @IBAction
    func videoOptionButtonTapped(_ sender: RoundedButton) {
        
    }
    
    @IBAction
    func blogOptionButtonTapped(_ sender: RoundedButton) {
        dismiss(animated: true) {
            self.viewModel.router.append(.createBlog, animated: false)
        }
    }
    
    // MARK: - Private Methods
    
    
}

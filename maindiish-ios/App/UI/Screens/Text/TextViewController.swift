//
//  TextViewController.swift
//  maindiish-ios
//
//  Created by Faizan Tanveer on 04/12/2023.
//

import Foundation
import UIKit

class TextViewController: ViewController<TextViewModel> {
    
    // MARK: - Outlets
    
    @IBOutlet weak var textScreenView: TextView!
    
    // MARK: - Action Methods
    
    @IBAction
    func backButtonTapped(_ sender: UIButton) {
        viewModel.router.pop(animated: true)
    }
    
    // MARK: - Lifecycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textScreenView.setView(for: viewModel.textType)
        
        let htmlString = Utils.contentsOfFile(viewModel.textType.rawValue, type: "html")
        textScreenView.webView.loadHTMLString(htmlString, baseURL: nil)
    }

}

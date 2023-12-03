//
//  TextView.swift
//  maindiish-ios
//
//  Created by Faizan Tanveer on 04/12/2023.
//

import UIKit
import WebKit

class TextView: UIView {
    
    // MARK: - Outlets
    
    @IBOutlet weak var screenTitleLabel: UILabel!
    
    @IBOutlet weak var textView: UITextView!
    
    var webView = WKWebView()
    
    // MARK: - Lifecycle Methods
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        webView.frame = textView.bounds
        textView.isHidden = true
    }
    
    // MARK: - Private Methods
    
    private func setFonts() {
        
    }
    
    // MARK: - Public Methods
    
    func setView(for textType: HTMLFile) {
        screenTitleLabel.text = textType.screenTitle
        textView.attributedText = textType.textToDisplay
    }
    
}

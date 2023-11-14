//
//  ProgressLoaderManager.swift
//  maindiish-ios
//
//  Created by Faizan Tanveer on 14/11/2023.
//

import Foundation
import MBProgressHUD

class ProgressLoaderManager {
    
    static var shared = ProgressLoaderManager()
    
    private init() { }
    
    func show(for view: UIView, message: String? = nil) {
        let loader = MBProgressHUD.showAdded(to: view, animated: true)
        loader.bezelView.backgroundColor = .gray
        loader.mode = .indeterminate
        if let message = message {
            loader.label.text = message
        }
        loader.contentColor = .appThemeColor
    }
    
    func hide(for view: UIView) {
        MBProgressHUD.hide(for: view, animated: true)
    }
}

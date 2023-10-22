//
//  SplashView.swift
//  BaseCode
//
//  Created by Faizan Tanveer on 18/10/2023.
//

import UIKit

class SplashView: UIView {

    @IBOutlet weak var splashImageView: UIImageView!
    
    func animate(completion: @escaping () -> Void) {
        splashImageView.alpha = 0.0
        UIView.animate(withDuration: 1) {
            self.splashImageView.alpha = 1.0
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                completion()
            }
        }
    }
}

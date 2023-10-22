//
//  SplashViewController.swift
//  BaseCode
//
//  Created by  on 27/07/2023.
//

import UIKit

class SplashViewController: ViewController<SplashViewModel> {
    
    // MARK: - Outlets
    
    @IBOutlet weak var splashView: SplashView!
    
    // MARK: - Lifecycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        splashView.animate {
            let nextRoute: Route = UserDefaultsManager.shared.isOnboarding ? .onboarding : .home
            self.viewModel.router.append(nextRoute, animated: false)
        }
    }
    
}

import Foundation
import UIKit

extension UINavigationController {
    
    open override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        navigationBar.topItem?.backButtonDisplayMode = .minimal
    }
    
    enum NavigationBarType {
        case preLogin
        case postLogin
    }
    
    func setNavigationBar(for barType: NavigationBarType) {
        switch barType {
            case .preLogin:
                setPreLogin()
            case .postLogin:
                setPostLogin()
        }
    }
    
    private func setPreLogin() {
        navigationBar.tintColor = .onboardingTitleLabel
        
        navigationBar.titleTextAttributes = [.font: Fonts.robotoRegular.font(15)!]
       
        let backButtonImage = UIImage(named: "back_button_icon")
        navigationBar.backIndicatorImage = backButtonImage
        navigationBar.backIndicatorTransitionMaskImage = backButtonImage
    }
    
    private func setPostLogin() {
        
    }
}

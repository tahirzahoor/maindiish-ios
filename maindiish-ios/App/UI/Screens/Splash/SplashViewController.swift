import UIKit

class SplashViewController: ViewController<SplashViewModel> {
    
    // MARK: - Outlets
    
    @IBOutlet weak var splashView: SplashView!
    
    // MARK: - Lifecycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let theme: Theme = UserDefaultsManager.shared.isDarkMode ? .dark : .light
        ThemeManager.shared.currentTheme = theme
        
        splashView.animate {
            let nextRoute: Route = UserDefaultsManager.shared.isOnboarding ? .onboarding : .home
            self.viewModel.router.append(nextRoute, animated: false)
        }
    }
    
}

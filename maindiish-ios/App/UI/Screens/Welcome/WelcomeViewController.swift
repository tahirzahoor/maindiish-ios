import Foundation

class WelcomeViewController: ViewController<WelcomeViewModel> {
    
    // MARK: - Outlets
    
    @IBOutlet weak var welcomeView: WelcomeView!
    
    // MARK: - Action Methods
    
    @IBAction
    func onLoginButtonTap(_ sender: RoundedButton) {
        viewModel.router.setRoot(.mainTab)
    }
    
    @IBAction
    func onSignUpButtonTap(_ sender: RoundedButton) {
        viewModel.router.append(.signup, animated: true)
    }
    
    // MARK: - Lifecycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UserDefaultsManager.shared.isOnboarding = false
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
}

import IQKeyboardManagerSwift
import SwiftDI
import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    var router: Router?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {

        guard let windowScene = (scene as? UIWindowScene) else {
            return
        }

        configureApp(with: windowScene)
    }

    private func configureApp(with windowScene: UIWindowScene) {
        
        IQKeyboardManager.shared.enable = true
        
        let window = UIWindow(windowScene: windowScene)
        let navigationController = UINavigationController()
        navigationController.setNavigationBarHidden(true, animated: true)
        
        let router = AppRouter(
            navigationController: navigationController,
            route: .splash
        )
        self.router = router
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
        self.window = window

        Resolver.default.register(
            type: Router.self,
            factory: { router }
        )
        
        registerDependencies()
        
        router.start()
    }

    private func registerDependencies() {
        // TODO: Register dependencies such as repositories, managers etc
    }
    
    private func setNavigationBar() {
        
    }
}


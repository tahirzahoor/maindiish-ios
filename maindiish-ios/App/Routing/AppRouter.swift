import UIKit

class AppRouter: Router {

    var navigationController: UINavigationController
    private var initialRoute: Route

    init(navigationController: UINavigationController, route: Route) {
        self.navigationController = navigationController
        self.initialRoute = route
    }

    func start() {
        let controller = initialRoute.controller()
        navigationController.pushViewController(controller, animated: true)
    }

    func append(_ route: Route, animated: Bool = true) {
        let controller = route.controller()
        navigationController.pushViewController(controller, animated: animated)
    }

    func pop(animated: Bool = true) {
        navigationController.popViewController(animated: animated)
    }

    func setRoot(_ route: Route) {
        let controller = route.controller()
        navigationController.viewControllers = [controller]
    }

    func showSheet(_ sheet: Sheet, animated: Bool = true) {
        let controller = sheet.controller()
        navigationController.present(controller, animated: animated)
    }
}

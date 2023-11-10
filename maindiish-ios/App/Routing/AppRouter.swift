import UIKit

class AppRouter: Router {

    var navigationController: UINavigationController
    private var initialRoute: Route
    private var routes = [Route]()

    init(navigationController: UINavigationController, route: Route) {
        self.navigationController = navigationController
        self.initialRoute = route
    }

    func start() {
        let controller = initialRoute.controller()
        navigationController.pushViewController(controller, animated: true)
        routes = [initialRoute]
    }

    func append(_ route: Route, animated: Bool = true) {
        let controller = route.controller()
        navigationController.pushViewController(controller, animated: animated)
        routes.append(route)
    }

    func pop(animated: Bool = false) {
        navigationController.popViewController(animated: animated)
        routes.removeLast()
    }

    func setRoot(_ route: Route) {
        let controller = route.controller()
        navigationController.viewControllers = [controller]
        routes = [route]
    }

    func showSheet(_ sheet: Sheet, animated: Bool = true) {
        let controller = sheet.controller()
        navigationController.present(controller, animated: animated)
    }
    
    func pop(back steps: Int) {
        if navigationController.viewControllers.count > steps {
            navigationController.viewControllers.removeLast(steps)
            routes.removeLast(steps)
        }
    }
    
    func pop(to route: Route) {
       
    }
    
}

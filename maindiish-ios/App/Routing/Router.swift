import Foundation

protocol Router {

    func start()
    func append(_ route: Route, animated: Bool)
    func pop(animated: Bool)
    func setRoot(_ route: Route)
    func showSheet(_ sheet: Sheet, animated: Bool)
    func pop(back steps: Int)
    func present(_ route: Route, animated: Bool)
   
}

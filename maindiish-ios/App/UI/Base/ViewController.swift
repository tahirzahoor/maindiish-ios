import Combine
import UIKit

class ViewController<T: ViewModel>: UIViewController {

    var viewModel: T
    var bag = Set<AnyCancellable>()
    var activityIndicator = UIActivityIndicatorView(style: .large)
    var originalCenter: CGPoint = .zero
    

    // MARK: - Initialization

    init(viewModel: T) {
        self.viewModel = viewModel
        super.init(nibName: Self.identifier, bundle: nil)
    }

    required init?(coder: NSCoder, viewModel: T) {
        self.viewModel = viewModel
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    static func instantiate(from storyboard: UIStoryboard.Storyboard, viewModel: T) -> Self {
        let identifier = Self.identifier
        let storyboard = UIStoryboard(name: storyboard.rawValue, bundle: nil)
        let controller = storyboard.instantiateViewController(identifier: identifier) { coder in
            Self.init(coder: coder, viewModel: viewModel)
        }
        return controller
    }

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
       
        setNavigationBar()
        setupBinding()
    }
    
    func addDragDownGesture(to view: UIView) {
        let gesture = UIPanGestureRecognizer(target: self, action: #selector(didDragDown(_:)))
        view.addGestureRecognizer(gesture)
    }
    
    @objc
    private func didDragDown(_ recognizer: UIPanGestureRecognizer) {
        
        guard let view = recognizer.view else { return }
        
        let translation = recognizer.translation(in: view)
        let optionBgViewHeight = view.frame.height
        let halfHeightYPoint = view.bounds.maxY - (optionBgViewHeight/2)
        
        // MARK: - Logic to be implemented
        
        dismiss(animated: true)
    }
}

// MARK: - Public Methods

extension ViewController {

    func setupBinding() {
        viewModel
            .$isLoading
            .sink { [weak self] isLoading in
                self?.showLoader(isLoading)
            }
            .store(in: &bag)

        viewModel
            .$error
            .compactMap({ $0 })
            .sink { [weak self] error in
                self?.showAlert(with: error)
            }
            .store(in: &bag)

        viewModel
            .$alert
            .compactMap { $0 }
            .sink { [weak self] alert in
                self?.showAlert(with: alert)
            }
            .store(in: &bag)
    }

    func showLoader(_ show: Bool) {
        if show {
            view.isUserInteractionEnabled = false
            view.addSubview(activityIndicator)
            activityIndicator.center = view.center
            activityIndicator.startAnimating()
        } else {
            view.isUserInteractionEnabled = true
            activityIndicator.removeFromSuperview()
            activityIndicator.stopAnimating()
        }
    }

    func setNavigationBar() {
        let isLoggedIn = UserDefaultsManager.shared.isLoggedIn
        navigationController?.setNavigationBar(for: isLoggedIn ? .postLogin : .preLogin)
    }
    
    func addController(_ controller: UIViewController, fixIn container: UIView) {
        addChild(controller)
        controller.view.fixInView(container)
        controller.didMove(toParent: self)
    }
    
    func removeController(_ controller: UIViewController) {
        controller.willMove(toParent: nil)
        controller.view.removeFromSuperview()
        controller.removeFromParent()
    }

}



import Foundation
import UIKit

fileprivate enum Tab: CaseIterable {
    case explore
    case trending
    
    var controller: UIViewController {
        return switch self {
            case .explore:
                Route.explore.controller()
            case .trending:
                Route.trending.controller()
        }
    }
}

class MainTabViewController: ViewController<MainTabViewModel> {
    
    // MARK: - Outlets
    
    @IBOutlet weak var mainTabsView: MainTabsView!
    
    // MARK: - Private Properties
    
    private var currentTab = Tab.explore
    
    private lazy var exploreVC: UIViewController = {
        Route.explore.controller()
    }()
    
    private lazy var trendingVC: UIViewController = {
        Route.trending.controller()
    }()
    
    // MARK: - Action Methods
    
    @IBAction
    func addButtonTapped(_ sender: UIButton) {
        viewModel.router.showSheet(.postType, animated: true)
    }
    
    @IBAction
    func tabTapped(_ sender: UIButton) {
        removeCurrentController()
        
        mainTabsView.updateTabBarView(for: sender)
        
        let selectedTab = Tab.allCases[sender.tag]
        currentTab = selectedTab
        
        addController()
    }
    
    // MARK: - Lifecycle Methods
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        addController()
    }
    
    // MARK: - Public Methods
    
    private func addController() {
        switch currentTab {
            case .explore:
                addController(exploreVC, fixIn: mainTabsView.selectedTabView)
            case .trending:
                addController(trendingVC, fixIn: mainTabsView.selectedTabView)
        }
    
    }
    
    private func removeCurrentController() {
        switch currentTab {
            case .explore:
                removeController(exploreVC)
            case .trending:
                removeController(trendingVC)
        }
    }
    
//    private func add(childController controller: UIViewController) {
//        addChild(controller)
//        controller.view.frame = mainTabsView.selectedTabView.bounds
//        mainTabsView.selectedTabView.addSubview(controller.view)
//        controller.didMove(toParent: self)
//    }
//    
//    private func remove(currentController controller: UIViewController) {
//        controller.willMove(toParent: nil)
//        controller.view.removeFromSuperview()
//        controller.removeFromParent()
//    }
    
}

extension MainTabViewController: ConfirmMediaDelegate {
    
    func didConfirmSelectedMedia(type: MediaCaptureConfiguration.MediaType) {
        viewModel.router.append(.createBrief(type), animated: false)
    }
    
}

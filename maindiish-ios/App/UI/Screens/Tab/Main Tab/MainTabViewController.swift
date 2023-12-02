import Foundation
import UIKit

enum Tab: String, CaseIterable {
    case explore
    case briefs
    case trending
    case inbox
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
    
    private lazy var briefsVC: UIViewController = {
        Route.briefs.controller()
    }()
    
    private lazy var inboxVC: UIViewController = {
       UIViewController()
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
        
        var controller: UIViewController
        
        switch currentTab {
            case .explore:
                controller = exploreVC
            case .trending:
                controller = trendingVC
            case .briefs:
                controller = briefsVC
            case .inbox:
                controller = inboxVC
        }
        
        addController(controller, fixIn: mainTabsView.selectedTabView)
    }
    
    private func removeCurrentController() {
        
        var controller: UIViewController
        
        switch currentTab {
            case .explore:
                controller = exploreVC
            case .trending:
                controller = trendingVC
            case .briefs:
                controller = briefsVC
            case .inbox:
                controller = inboxVC
        }
        
        removeController(controller)
    }
    
}

// MARK: - ConfirmMediaDelegate Methods

extension MainTabViewController: ConfirmMediaDelegate {
    func didConfirmSelectedMedia(type: MediaCaptureConfiguration.MediaType) {
        viewModel.router.append(.createBrief(type), animated: false)
    }
}

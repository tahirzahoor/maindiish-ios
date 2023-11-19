//
//  ProfileViewController.swift
//  maindiish-ios
//
//  Created by Faizan Tanveer on 20/11/2023.
//

import Foundation
import UIKit

class ProfileViewController: ViewController<ProfileViewModel> {
    
    // MARK: - Outlets
    
    @IBOutlet weak var profileView: ProfileView!
    
    // MARK: - Private Properties
    
    private var currentController: UIViewController?
    
    private var blogsVC: SearchedBlogsViewController {
        let viewModel = SearchedBlogsViewModel()
        let controller = SearchedBlogsViewController.instantiate(from: .TabControllers, viewModel: viewModel)
        
        return controller
    }
    
    private var briefsVC: BriefCollectionViewController {
        let viewModel = BriefCollectionViewModel()
        let controller = BriefCollectionViewController.instantiate(from: .TabControllers, viewModel: viewModel)
        
        return controller
    }
    
    // MARK: - Lifecycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addGestures()
        profileView.setView(for: .all)
        setupViewForCurrentFilter()
    }
    
    // MARK: - Private Methods
    
    private func addGestures() {
        let gesture = UIGestureRecognizer(target: self, action: #selector(tabDidChange(_:)))
        
        profileView.allTabsView.addGestureRecognizer(gesture)
        profileView.blogTabView.addGestureRecognizer(gesture)
        profileView.briefsTabView.addGestureRecognizer(gesture)
    }
    
    @objc
    private func tabDidChange(_ view: UIView) {
        let selectedTab = TabItem.allCases[view.tag - 1]
        profileView.setView(for: selectedTab)
        removeCurrentFilterView()
        setupViewForCurrentFilter()
    }
    
    private func setupViewForCurrentFilter() {
        
        switch viewModel.tab {
            case .blogs:
                currentController = blogsVC
            case .briefs:
                currentController = briefsVC
            case .all:
                currentController = UIViewController()
        }
        
        addController(currentController!, fixIn: profileView.contentView)
    }
    
    private func removeCurrentFilterView() {
        removeController(currentController!)
    }

}

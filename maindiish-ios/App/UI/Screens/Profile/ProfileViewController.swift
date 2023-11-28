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
    
    private var exploreVC: ExploreViewController {
        let viewModel = ExploreViewModel()
        viewModel.isForProfile = true
        let controller = ExploreViewController.instantiate(from: .TabControllers, viewModel: viewModel)
        
        return controller
    }
    
    private var currentController = UIViewController()
    
    // MARK: - Lifecycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setInitialView()
        setupViewForCurrentTab()
    }
    
    // MARK: - Action Methods
    
    @IBAction
    func settingsButtonTapped(_ sender: UIButton) {
        viewModel.router.append(.settings, animated: true)
    }
    
    // MARK: - Private Methods
    
    private func setupViewForCurrentTab() {
        
        switch viewModel.tab {
            case .blogs:
                currentController = blogsVC
            case .briefs:
                currentController = briefsVC
            case .all:
                currentController = exploreVC
        }
        
        addController(currentController, fixIn: profileView.contentView)
    }
    
    private func removeCurrentTabView() {
        removeController(currentController)
    }

    private func setInitialView() {
        guard viewModel.id.isEmpty else { return }
        
        profileView.settingsButton.isHidden = false
        profileView.buttonsViewHeightLayoutConstraint.constant = 0
        profileView.followAndMessageButtonsView.isHidden = true
    }
}

extension ProfileViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        TabItem.allCases.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: ProfileTabCollectionViewCell = collectionView.dequeueCell(for: indexPath)
        
        let tab = TabItem.allCases[indexPath.row]
        cell.tabTitleLabel.text = tab.rawValue.capitalized
        cell.setView(isSelected: tab == viewModel.tab)
        
        return cell
    }
}

extension ProfileViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        removeCurrentTabView()
        let tab = TabItem.allCases[indexPath.row]
        viewModel.tab = tab
        setupViewForCurrentTab()
        profileView.tabCollectionView.reloadData()
    }
}

extension ProfileViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = profileView.tabCollectionView.bounds.width / CGFloat(TabItem.allCases.count)
        return CGSize(width: width, height: 32)
    }
}


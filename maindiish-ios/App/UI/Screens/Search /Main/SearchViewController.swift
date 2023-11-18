//
//  SearchViewController.swift
//  maindiish-ios
//
//  Created by Faizan Tanveer on 18/11/2023.
//

import Foundation
import UIKit

class SearchViewController: ViewController<SearchViewModel> {
    
    // MARK: - Outlets
    
    @IBOutlet weak var searchView: SearchView!
    
    // MARK: - Private Properties
    
    private lazy var blogsViewController: SearchedBlogsViewController = {
        let viewModel = SearchedBlogsViewModel()
        let controller = SearchedBlogsViewController.instantiate(from: .TabControllers, viewModel: viewModel)
        
        return controller
    }()
    
    // MARK: - Lifecycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupBindings()
    }
    
    // MARK: - Action Methods
    
    @IBAction
    func backButtonTapped(_ sender: UIButton) {
        viewModel.router.pop(animated: false)
    }
    
    @IBAction
    func filterButtonTapped(_ sender: RoundedButton) {
        
        let selectedFilter = SearchFilter.allCases[sender.tag]
        viewModel.currentFilter = selectedFilter
        
        //searchView.setButtonsView(for: selectedFilter)
    }
    
    // MARK: - Private Methods
    
    private func setupBindings() {
        viewModel
            .$currentFilter
            .sink { [weak self] in
                self?.searchView.setButtonsView(for: $0)
            }
            .store(in: &bag)
    }
    
}

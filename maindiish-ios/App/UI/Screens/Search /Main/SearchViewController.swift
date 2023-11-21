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
    
    private var currentController: UIViewController?
    private var delegate: SearchDelegate?
    
    private var blogsViewController: SearchedBlogsViewController {
        let viewModel = SearchedBlogsViewModel()
        let controller = SearchedBlogsViewController.instantiate(from: .TabControllers, viewModel: viewModel)
        self.delegate = controller
        
        return controller
    }
    
    private var peopleListViewController: SearchedPeopleViewController {
        let viewModel = SearchedPeopleViewModel()
        let controller = SearchedPeopleViewController.instantiate(from: .TabControllers, viewModel: viewModel)
        self.delegate = controller
        
        return controller
    }
    
    private var briefsViewController: BriefCollectionViewController {
        let viewModel = BriefCollectionViewModel()
        let controller = BriefCollectionViewController.instantiate(from: .TabControllers, viewModel: viewModel)
        self.delegate = controller
        
        return controller
    }
    
    // MARK: - Lifecycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViewForCurrentFilter()
    }
    
    // MARK: - Action Methods
    
    @IBAction
    func backButtonTapped(_ sender: UIButton) {
        viewModel.router.pop(animated: false)
    }
    
    @IBAction
    func filterButtonTapped(_ sender: RoundedButton) {
        guard sender.tag != viewModel.currentFilter.rawValue else { return }
        
        searchView.searchField.text = ""
        removeCurrentFilterView()
        
        let selectedFilter = SearchFilter.allCases[sender.tag]
        viewModel.currentFilter = selectedFilter
        
        searchView.setButtonsView(for: viewModel.currentFilter)
        setupViewForCurrentFilter()
    }
    
    @IBAction
    func searchFieldTextChanged(_ sender: UITextField) {
        delegate?.filterData(for: sender.text ?? "")
    }
    
    // MARK: - Private Methods
    
    private func setupBindings() {
       
    }
    
    private func setupViewForCurrentFilter() {
        
        switch viewModel.currentFilter {
            case .blog:
                currentController = blogsViewController
            case .people:
                currentController = peopleListViewController
            case .brief:
            currentController = peopleListViewController
              //  currentController = briefsViewController
        }
        
        addController(currentController!, fixIn: searchView.filteredDataView)
    }
    
    private func removeCurrentFilterView() {
        removeController(currentController!)
    }
   
}

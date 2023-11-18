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
    
    private var delegate: SearchDelegate?
    
    private lazy var blogsViewController: SearchedBlogsViewController = {
        let viewModel = SearchedBlogsViewModel()
        let controller = SearchedBlogsViewController.instantiate(from: .TabControllers, viewModel: viewModel)
        self.delegate = controller
        
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
        viewModel
            .$currentFilter
            .sink { _ in
               // self?.searchView.setButtonsView(for: $0)
                //self?.setupViewForCurrentFilter()
            }
            .store(in: &bag)
    }
    
    private func setupViewForCurrentFilter() {
        switch viewModel.currentFilter {
            case .blog:
                addController(blogsViewController, fixIn: searchView.filteredDataView)
            default:
                break
        }
    }
    
    private func removeCurrentFilterView() {
        switch viewModel.currentFilter {
            case .blog:
                removeController(blogsViewController)
            default:
                break
        }
    }
   
}

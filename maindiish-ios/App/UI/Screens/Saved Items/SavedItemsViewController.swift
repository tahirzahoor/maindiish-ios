//
//  SavedItemsViewController.swift
//  maindiish-ios
//
//  Created by Faizan Tanveer on 29/11/2023.
//

import Foundation
import UIKit

class SavedItemsViewController: ViewController<SavedItemsViewModel> {
    
    // MARK: - Outlets
    
    @IBOutlet weak var savedItemsView: SavedItemsView!
    
    // MARK: - Lifecycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        registerTableViewCells()
        savedItemsView.tableView.showsVerticalScrollIndicator = false
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        savedItemsView.tableView.reloadData()
    }
    
    // MARK: - Action Methods
    
    @IBAction
    func backButtonTapped(_ sender: UIButton) {
        viewModel.router.pop(animated: true)
    }
    
    // MARK: - Private Methods
    
    private func registerTableViewCells() {
        let blogPostNIB = UINib(nibName: "BlogPostCellTableViewCell", bundle: nil)
        savedItemsView.tableView.register(blogPostNIB, forCellReuseIdentifier: BlogPostCellTableViewCell.reuseIdentifier)
        
        let briefPostNIB = UINib(nibName: "BriefPostTableViewCell", bundle: nil)
        savedItemsView.tableView.register(briefPostNIB, forCellReuseIdentifier: BriefPostTableViewCell.reuseIdentifier)
    }
    
    private func showDetails(for post: PostData) {
        viewModel.router.append(.postDetail(data: post), animated: true)
    }
}

// MARK: - UITableViewDelegate Methods

extension SavedItemsViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let sectionTitleLabel = UILabel()
        sectionTitleLabel.font = Fonts.interRegular.font(16)
        sectionTitleLabel.text = SavedItemsSection.allCases[section].title
        
        let headerView = UIView()
        headerView.backgroundColor = .systemBackground
    
        sectionTitleLabel.fixInView(headerView)
        
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        43
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.selectionStyle = .none
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == SavedItemsSection.blogs.rawValue {
            let post = viewModel.blogs[indexPath.row]
            showDetails(for: post)
        }
    }
}

// MARK: - UITableViewDataSource Methods

extension SavedItemsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return section == 0 ? viewModel.briefs.count : viewModel.blogs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let section = indexPath.section
        let row = indexPath.row
        
        if section == SavedItemsSection.videos.rawValue {
            let cell: BriefPostTableViewCell = tableView.dequeueCell(for: indexPath)
            
            let brief = viewModel.briefs[indexPath.row]
            cell.setData(brief)
            cell.optionsButton.indexPath = indexPath
            cell.optionsButtonDelegate = self
            
            return cell
        
        } else {
            let cell: BlogPostCellTableViewCell = tableView.dequeueCell(for: indexPath)
            
            let blog = viewModel.blogs[row]
            cell.setData(blog)
            cell.optionsButton.indexPath = indexPath
            cell.optionsButtonDelegate = self
            
            return cell
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        SavedItemsSection.allCases.count
    }
}

// MARK: - Options Button Delegate

extension SavedItemsViewController: OptionsButtonDelegate {
    func didTapOptionsButton(forRowAt indexPath: IndexPath) {
        let section = indexPath.section
        let row = indexPath.row
        
        switch section {
            case SavedItemsSection.videos.rawValue:
                break
            case SavedItemsSection.blogs.rawValue:
                break
            default:
                break
        }
    }
}
 

//
//  BriefsViewController.swift
//  maindiish-ios
//
//  Created by Faizan Tanveer on 02/12/2023.
//

import Foundation
import UIKit

class BriefsViewController: ViewController<BriefsViewModel> {
    
    // MARK: - Outlets
    
    @IBOutlet weak var briefsView: BriefsView!
    
    // MARK: - Lifecycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        registerTableViewCells()
        if let firstBriefData = viewModel.briefs.first, let url = firstBriefData.videoURL {
            VideoPlayerManager.shared.playVideo(url: url, inLayer: briefsView.videoPlayerView.layer)
        }
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        VideoPlayerManager.shared.stopPlayback()
    }
    
    // MARK: - Action Methods
    
    @IBAction
    func searchButtonTapped(_ sender: UIButton) {
        
    }
    
    @IBAction
    func notificationsButtonTapped(_ sender: UIButton) {
        
    }
    
    @IBAction
    func profileButtonTapped(_ sender: UIButton) {
        
    }
    
    // MARK: - Private Methods
    
    private func registerTableViewCells() {
        let nib = UINib(nibName: "BriefsTableViewCell", bundle: nil)
        briefsView
            .tableView
            .register(
                nib,
                forCellReuseIdentifier: BriefsTableViewCell.reuseIdentifier
            )
    }
    
}

// MARK: - UITableViewDelegate Methods

extension BriefsViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        view.bounds.height
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        guard let indexPath = briefsView.tableView.indexPathForRow(at: scrollView.contentOffset) else { return }
        
        let url = viewModel.briefs[indexPath.row].videoURL
        let cell: BriefsTableViewCell = briefsView.tableView.dequeueCell(for: indexPath)
        
        if let url = url {
            VideoPlayerManager.shared.playVideo(url: url, inLayer: briefsView.videoPlayerView.layer)
        }
    }
    
}

// MARK: - UITableViewDataSource Methods

extension BriefsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.briefs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: BriefsTableViewCell = tableView.dequeueCell(for: indexPath)
        
        let data = viewModel.briefs[indexPath.row]
        cell.configure(with: data)
        
        return cell
    }
}

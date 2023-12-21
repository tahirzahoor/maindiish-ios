//
//  NotificationViewController.swift
//  maindiish-ios
//
//  Created by Faizan Tanveer on 21/12/2023.
//

import Foundation
import UIKit

class NotificationViewController: ViewController<NotificationViewModel> {
    
    // MARK: - Outlets
    
    @IBOutlet weak var notificationView: NotificationsView!
    
    // MARK: - Lifecycle Methods
    
    // MARK: - Action Methods
    
    @IBAction func backButtonTapped(_ sender: UIButton) {
        viewModel.router.pop(animated: true)
    }
    
}

// MARK: - UITableViewDelegate Methods

extension NotificationViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        21
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        26
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let containerView = UIView()
        containerView.backgroundColor = .clear
        
        let sectionTitleLabel = UILabel()
        sectionTitleLabel.text = viewModel.sections[section].title
        sectionTitleLabel.textColor = .white
        sectionTitleLabel.font = Fonts.robotoSemibold.font(16)
        
        containerView.addSubview(sectionTitleLabel)
        
        sectionTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            sectionTitleLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            sectionTitleLabel.topAnchor.constraint(equalTo: containerView.topAnchor),
            sectionTitleLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -12)
        ])
        
        return containerView
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let containerView = UIView()
        containerView.backgroundColor = .clear
        
        let lineView = UIView()
        lineView.backgroundColor = UIColor(red: 0.822, green: 0.822, blue: 0.822, alpha: 0.4)
        
        containerView.addSubview(lineView)
        
        lineView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            lineView.heightAnchor.constraint(equalToConstant: 1),
            lineView.topAnchor.constraint(equalTo: containerView.topAnchor),
            lineView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            lineView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor)
        ])
        
        return containerView
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }
}

// MARK: - UITableViewDataSource Methods

extension NotificationViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        viewModel.sections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.sections[section].rows.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let data = viewModel.sections[indexPath.section].rows[indexPath.row]
        
        switch data.cellType {
            case .followable:
                let cell: FollowableUserNotificationTableViewCell = tableView.dequeueCell(for: indexPath)
                cell.configure(with: data)
                return cell
            case .actioned:
                let cell: TextNotificationTableViewCell = tableView.dequeueCell(for: indexPath)
                cell.configure(with: data)
                return cell
        }
    }
}



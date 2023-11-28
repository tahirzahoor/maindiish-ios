//
//  SettingsViewController.swift
//  maindiish-ios
//
//  Created by Faizan Tanveer on 28/11/2023.
//

import Foundation
import UIKit

class SettingsViewController: ViewController<SettingsViewModel> {
    
    // MARK: - Outlets
    
    @IBOutlet weak var settingsView: SettingsView!
    
    // MARK: - Action Methods
    
    @IBAction
    func switchToggled(_ sender: UISwitch) {
        sender.isSelected.toggle()
        
        UserDefaultsManager.shared.isDarkMode = sender.isSelected
    }
    
    @IBAction
    func backButtonTapped(_ sender: UIButton) {
        viewModel.router.pop(animated: true)
    }
    
}

// MARK: - UITableViewDelegate Methods

extension SettingsViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.performAction(forRowAt: indexPath)
    }

    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if let cell = cell as? SettingsSectionHeaderTableViewCell,
           cell.headerLabel.text == "Log out" {
            cell.headerLabel.topAnchor.constraint(equalTo: cell.topAnchor, constant: 25).isActive = true
            cell.headerLabel.textColor = .red
            cell.headerLabel.font = Fonts.interMedium.font(14)
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }
}

// MARK: - UITableViewDataSource Methods

extension SettingsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let rowType = viewModel.sections[indexPath.section].rows[indexPath.row]
        
        switch rowType {
            case .header(let title), .tappable(let title):
                let cell: SettingsSectionHeaderTableViewCell = tableView.dequeueCell(for: indexPath)
                cell.headerLabel.text = title
                
                return cell
            
            case .routable(let title, _):
                let cell: ChevronActionTableViewCell = tableView.dequeueCell(for: indexPath)
                cell.actionNameLabel.text = title
            
                return cell
            
            case .toggleable(let title):
                let cell: SwitchActionTableViewCell = tableView.dequeueCell(for: indexPath)
                cell.actionNameLabel.text = title
                cell.toggleSwitch.isOn = UserDefaultsManager.shared.isDarkMode
            
                return cell
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.sections[section].rows.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        viewModel.sections.count
    }
}

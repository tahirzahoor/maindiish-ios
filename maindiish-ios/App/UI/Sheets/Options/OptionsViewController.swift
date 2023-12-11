//
//  OptionsViewController.swift
//  maindiish-ios
//
//  Created by Faizan Tanveer on 12/12/2023.
//

import Foundation
import UIKit

class OptionsViewController: ViewController<OptionsViewModel> {
    
    // MARK: - Outlets
    
    @IBOutlet weak var optionsView: OptionsView!
    
    // MARK: - Delegates
    
    var delegate: OptionDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addDragDownGesture(
            to: optionsView.optionsBackgroundView
        )
    }
    
}

// MARK: - UITableViewDelegate Methods

extension OptionsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        dismiss(animated: true) {
            self.delegate?.didSelectOption(at: indexPath.row)
        }
    }
}

// MARK: - UITableViewDataSource Methods

extension OptionsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.options.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let option = viewModel.options[indexPath.row]
        
        switch option.cellType {
            case .imageAndLabel(let isRed):
                let cell: ImageAndLabelOptionTableViewCell = tableView.dequeueCell(for: indexPath)
                if isRed{
                    cell.optionLabel.textColor = .appThemeColor
                }
                cell.configure(with: option)
                
                return cell
            
            case .singleLabel:
                let cell: SingleLabelOptionTableViewCell = tableView.dequeueCell(for: indexPath)
                cell.configure(with: option)
                
                return cell
        }
    }
}

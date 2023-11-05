//
//  BottomUpOptionsSheetViewController.swift
//  maindiish-ios
//
//  Created by Faizan Tanveer on 29/10/2023.
//

import Foundation
import UIKit

class BottomUpOptionsSheetViewController: ViewController<BottomUpOptionsSheetViewModel> {
    
    // MARK: - Outlets
    
    @IBOutlet weak var bottomUpView: BottomUpOptionsSheetView!
    
    // MARK: - Delegates
    
    var delegate: BottomUpOptionsDelegate?
    
    // MARK: - Lifecycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addGestures()
        setupPickerView()
    }
    
    // MARK: - Private Methods
    
    private func addGestures() {
        let backgroundTapGesture = UITapGestureRecognizer(target: self, action: #selector(backgroundTapped))
        bottomUpView.backgroundView.addGestureRecognizer(backgroundTapGesture)
    }
    
    @objc
    private func backgroundTapped(_ sender: UITapGestureRecognizer) {
        dismiss(animated: true) {
            self.delegate?.didSelectOption(
                self.viewModel.selectedOption,
                at: self.viewModel.selectedOptionIndex
            )
        }
    }
    
    private func setupPickerView() {
        bottomUpView.optionSelectionView.selectRow(
            viewModel.selectedOptionIndex,
            inComponent: 0,
            animated: false
        )
    }
    
}

// MARK: - UIPickerViewDataSource Methods

extension BottomUpOptionsSheetViewController: UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        viewModel.optionsList.count
    }
    
}

// MARK: - UIPickerViewDelegate Methods

extension BottomUpOptionsSheetViewController: UIPickerViewDelegate {
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        viewModel.selectedOptionIndex = row
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        viewModel.optionsList[row]
    }
    
}

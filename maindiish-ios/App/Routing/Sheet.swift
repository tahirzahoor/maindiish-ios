//
//  Sheet.swift
//  BaseCode
//
//  Created by  on 27/07/2023.
//

import UIKit

enum Sheet {

    case confirmation
    case bottomUp(_ options: [String], delegate: BottomUpOptionsDelegate)

    func controller() -> UIViewController {
        switch self {
            case .confirmation:
                return UIViewController()
            case .bottomUp(let options, let delegate):
                let viewModel = BottomUpOptionsSheetViewModel(optionsList: options)
                let controller = BottomUpOptionsSheetViewController.instantiate(from: .PopUp, viewModel: viewModel)
                controller.delegate = delegate
                return controller
        }
    }
}

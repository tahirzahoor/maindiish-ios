//
//  Sheet.swift
//  BaseCode
//
//  Created by  on 27/07/2023.
//

import UIKit

enum Sheet {

    case okAlert(_ viewModel: ViewModel? = nil)

    func controller() -> UIViewController {
        switch self {
            case .okAlert(let VM):
                let viewModel = (VM as? AlertViewModel) ?? AlertViewModel()
                let controller = OkAlertViewController.instantiate(from: .PopUp, viewModel: viewModel)
                return controller
        }
    }
}

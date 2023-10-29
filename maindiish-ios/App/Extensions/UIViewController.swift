//
//  UIViewController.swift
//  BaseCode
//
//  Created by  on 26/07/2023.
//

import UIKit

extension UIViewController {

    static var identifier: String {
        String(describing: self)
    }

    func showAlert(with error: Error) {
        let viewModel = AlertViewModel(
            title: GlobalStrings.Title.error,
            message: error.localizedDescription
        )
        let alertController = OkAlertViewController.instantiate(
            from: .PopUp,
            viewModel: viewModel
        )
        present(alertController, animated: true)
    }

    func showAlert(with message: String) {
        let viewModel = AlertViewModel(
            title: GlobalStrings.Title.alert,
            message: message
        )
        let alertController = OkAlertViewController.instantiate(
            from: .PopUp,
            viewModel: viewModel
        )
        present(alertController, animated: true)
    }
    
    static func instantiate(from storyboard: UIStoryboard.Storyboard) -> Self {
        
        let storyboard = UIStoryboard(name: storyboard.rawValue, bundle: nil)
        
        let controller = storyboard.instantiateViewController(withIdentifier: Self.identifier) as! Self
        
        return controller
    }
    
}

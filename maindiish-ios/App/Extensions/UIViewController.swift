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
        let title = L10n.Localizable.error
        let message = error.localizedDescription
        let alertController = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert
        )
        let actionTitle = L10n.Localizable.ok
        let action = UIAlertAction(title: actionTitle, style: .default)
        alertController.addAction(action)
        present(alertController, animated: true)
    }

    func showAlert(with message: String) {
        let alertController = UIAlertController(
            title: nil,
            message: message,
            preferredStyle: .alert
        )
        let actionTitle = L10n.Localizable.ok
        let action = UIAlertAction(title: actionTitle, style: .default)
        alertController.addAction(action)
        present(alertController, animated: true)
    }
    
    static func instantiate(from storyboard: UIStoryboard.Storyboard) -> Self {
        
        let storyboard = UIStoryboard(name: storyboard.rawValue, bundle: nil)
        
        let controller = storyboard.instantiateViewController(withIdentifier: Self.identifier) as! Self
        
        return controller
    }
    
}

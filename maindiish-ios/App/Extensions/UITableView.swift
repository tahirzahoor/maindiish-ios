//
//  UITableView.swift
//  BaseCode
//
//  Created by  on 27/07/2023.
//

import UIKit

extension UITableView {

    func registerNib<T: UITableViewCell>(for type: T.Type) {
        let nib = UINib(nibName: T.reuseIdentifier, bundle: nil)
        register(nib, forCellReuseIdentifier: T.reuseIdentifier)
    }

    func dequeueCell<T: UITableViewCell>() -> T {
        let cell = dequeueReusableCell(withIdentifier: T.reuseIdentifier)
        return cell as! T
    }

    func dequeueCell<T: UITableViewCell>(for indexPath: IndexPath) -> T {
        let cell = dequeueReusableCell(withIdentifier: T.reuseIdentifier, for: indexPath)
        return cell as! T
    }

}

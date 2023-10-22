//
//  UICollectionView.swift
//  BaseCode
//
//  Created by  on 27/07/2023.
//

import UIKit

extension UICollectionView {

    func registerNib<T: UICollectionViewCell>(for type: T.Type) {
        let nib = UINib(nibName: T.identifier, bundle: nil)
        register(nib, forCellWithReuseIdentifier: T.identifier)
    }

    func dequeueCell<T: UICollectionViewCell>(for indexPath: IndexPath) -> T {
        let cell = dequeueReusableCell(withReuseIdentifier: T.identifier, for: indexPath)
        return cell as! T
    }

}

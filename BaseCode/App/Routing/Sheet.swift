//
//  Sheet.swift
//  BaseCode
//
//  Created by  on 27/07/2023.
//

import UIKit

enum Sheet {

    case confirmation

    func controller() -> UIViewController {
        switch self {
        case .confirmation:
            return UIViewController()
        }
    }
}

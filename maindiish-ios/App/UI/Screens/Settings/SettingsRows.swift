//
//  SettingsRows.swift
//  maindiish-ios
//
//  Created by Faizan Tanveer on 28/11/2023.
//

import Foundation

enum SettingsRows {
    case header(title: String)
    case routable(title: String, to: Route)
    case toggleable(title: String)
    case tappable(title: String)
}

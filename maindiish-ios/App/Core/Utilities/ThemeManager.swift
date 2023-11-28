//
//  ThemeManager.swift
//  maindiish-ios
//
//  Created by Faizan Tanveer on 28/11/2023.
//

import Foundation
import UIKit

enum Theme: String {
    case light, dark, system
}

class ThemeManager {
    static let shared = ThemeManager()

    var currentTheme: Theme = .system {
        didSet {
            applyTheme()
        }
    }
    
    private init() {
        setInitialTheme()
    }
    
    private func setInitialTheme() {
        let theme: Theme = UserDefaultsManager.shared.isDarkMode ? .dark : .light
        
        self.currentTheme = theme
    }
    
    func applyTheme() {
        if currentTheme == .system {
            UIApplication.shared.windows.forEach { window in
                window.overrideUserInterfaceStyle = .unspecified
            }
        } else {
            let style: UIUserInterfaceStyle = (currentTheme == .light) ? .light : .dark
            UIApplication.shared.windows.forEach { window in
                window.overrideUserInterfaceStyle = style
            }
        }
    }
}

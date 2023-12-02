//
//  SettingsSection.swift
//  maindiish-ios
//
//  Created by Faizan Tanveer on 28/11/2023.
//

import Foundation

enum SettingsSection: CaseIterable {
    case account
    case help
    
    private var title: String {
        self == .account ? "My Account" : "Help"
    }
    
    var rows: [SettingsRows] {
        self == .account ? [
            .header(title: self.title),
            .toggleable(title: "Dark Theme"),
            .routable(title: "My Profile", to: .editProfile),
            .routable(title: "Change Password", to: .changePassword),
            .routable(title: "Saved Items", to: .savedItems),
            .routable(title: "Blocked Accounts", to: .blockedAccounts)
        ] : [
            .header(title: self.title),
            .routable(title: "Terms And Conditions", to: .webView(url: nil)),
            .routable(title: "Privacy Policy", to: .webView(url: nil)),
            .routable(title: "Help Centre", to: .webView(url: nil)),
            .tappable(title: "Log out")
        ]
    }
}

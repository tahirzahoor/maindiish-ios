//
//  ConfirmationViewConfiguration.swift
//  maindiish-ios
//
//  Created by Faizan Tanveer on 14/12/2023.
//

import Foundation

struct ConfirmationViewConfiguration {
    var title = ""
    var button1Title = ""
    var button2Title = ""
    var button1Action: (() -> Void)?
    var button2Action: (() -> Void)?
}

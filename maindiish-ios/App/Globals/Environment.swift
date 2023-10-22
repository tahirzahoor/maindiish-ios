//
//  Environment.swift
//  BaseCode
//
//  Created by  on 27/07/2023.
//

import Foundation

enum Environment {

    case development

    static var current: Environment { .development }

    var baseUrl: URL {
        URL(string: "https://google.com")!
    }

}

//
//  ViewModel.swift
//  BaseCode
//
//  Created by  on 26/07/2023.
//

import Combine
import Foundation
import SwiftDI

class ViewModel: ObservableObject {

    @Published var isLoading: Bool = false

    // Can be changed to use PassThroughSubject depending upon project needs
    @Published var error: Error?
    @Published var alert: String?

    @Injected var router: Router
    
    var countryCodes: [CountryPhoneCode] {
        Utils.fetchCountryCodes()
    }
    
}

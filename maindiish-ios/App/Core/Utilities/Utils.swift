//
//  Utils.swift
//  maindiish-ios
//
//  Created by Faizan Tanveer on 29/10/2023.
//

import Foundation
import ObjectMapper

class Utils {
    static func fetchCountryCodes() -> [CountryPhoneCode] {
        guard let countryCodes = Mapper<CountryPhoneCodeList>().map(JSONfile: "countries_phone_codes_data.json") else {
            return []
        }
        
        return countryCodes.data
    }
}

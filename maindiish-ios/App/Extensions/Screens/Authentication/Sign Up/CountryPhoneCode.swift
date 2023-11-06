//
//  CountryPhoneCode.swift
//  maindiish-ios
//
//  Created by Faizan Tanveer on 27/10/2023.
//

import Foundation
import ObjectMapper

struct CountryPhoneCode: Mappable {

    var countryName = ""
    var countryCode = ""
    var dialCode = ""
    
    init?(map: ObjectMapper.Map) { }
    
    mutating func mapping(map: Map) {
        countryName <- map["name"]
        countryCode <- map["code"]
        dialCode <- map["dial_code"]
    }
}

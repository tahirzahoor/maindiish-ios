//
//  CountryPhoneCodeList.swift
//  maindiish-ios
//
//  Created by Faizan Tanveer on 27/10/2023.
//

import Foundation
import ObjectMapper

struct CountryPhoneCodeList: Mappable {
    
    var data: [CountryPhoneCode] = []
    
    init() { }
    
    init?(map: ObjectMapper.Map) { }
    
    mutating func mapping(map: Map) {
        data <- map["countries_phone_codes_list"]
    }
    
}

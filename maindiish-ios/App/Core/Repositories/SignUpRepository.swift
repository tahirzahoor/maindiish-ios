//
//  SignUpRepository.swift
//  maindiish-ios
//
//  Created by Faizan Tanveer on 27/10/2023.
//

import APIManager
import Foundation
import ObjectMapper

class SignUpRepository: Repository {
    
    func fetchCountryCodes() -> CountryPhoneCodeList? {
        guard let countryCodesList = Mapper<CountryPhoneCodeList>().map(JSONfile: "countries_phone_codes_data.json") else {
            return nil
        }
        
        return countryCodesList
    }
    
}

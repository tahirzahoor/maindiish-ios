import Foundation
import ObjectMapper
import UIKit

class Utils {
    static func fetchCountryCodes() -> [CountryPhoneCode] {
        guard let countryCodes = Mapper<CountryPhoneCodeList>().map(JSONfile: "countries_phone_codes_data.json") else {
            return []
        }
        
        return countryCodes.data
    }
   
    static func validateTags() {
        
    }
}

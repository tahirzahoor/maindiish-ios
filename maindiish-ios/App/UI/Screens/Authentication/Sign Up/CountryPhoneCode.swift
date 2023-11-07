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

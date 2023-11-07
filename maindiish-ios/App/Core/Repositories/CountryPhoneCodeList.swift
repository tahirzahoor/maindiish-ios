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

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
   
    static func formatLargeNumber(_ number: Double) -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.maximumFractionDigits = 1
        
        switch number {
        case 0..<1_000:
            return "\(number)"
        case 1_000..<1_000_000:
            return "\(numberFormatter.string(from: NSNumber(value: number / 1_000)) ?? "")K"
        case 1_000_000..<1_000_000_000:
            return "\(numberFormatter.string(from: NSNumber(value: number / 1_000_000)) ?? "")M"
        case 1_000_000_000..<1_000_000_000_000:
            return "\(numberFormatter.string(from: NSNumber(value: number / 1_000_000_000)) ?? "")B"
        default:
            return "\(numberFormatter.string(from: NSNumber(value: number / 1_000_000_000_000)) ?? "")T"
        }
    }
}

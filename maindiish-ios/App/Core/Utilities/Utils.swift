import Foundation
import AVFoundation
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
    
    static func fetchThumbnail(
        from videoURL: URL,
        completion: @escaping (UIImage?) -> Void
    ) {
        let asset = AVAsset(url: videoURL)
        let imageGenerator = AVAssetImageGenerator(asset: asset)

        let time = CMTime(value: asset.duration.value / 2, timescale: asset.duration.timescale)

        do {
            let cgImage = try imageGenerator.copyCGImage(at: time, actualTime: nil)
            let thumbnail = UIImage(cgImage: cgImage)
            completion(thumbnail)
        } catch {
            print("Error generating thumbnail: \(error.localizedDescription)")
            completion(nil)
        }
    }

}

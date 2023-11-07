import Foundation
import APIManager
import ObjectMapper

class APIClient: APIService {
    func fetch(request: APIRequest, completion: @escaping (Data) -> Void) {
        
    }
    
    func fetch(fileDataOf fileName: String, fileType: String, completion: @escaping (Data) -> Void) {
        let fileLocation = Bundle.main.path(forResource: fileName, ofType: fileType)!
        do {
            let data = try Data(contentsOf: URL(fileURLWithPath: fileLocation), options: .mappedIfSafe)
            completion(data)
        } catch {
            print(error)
        }
    }
    
    static func fetchData<T: Mappable>(from fileName: String, completion: (T) -> Void) {
        guard let mappedFileData = Mapper<T>().map(JSONfile: fileName) else {
            return
        }
        completion(mappedFileData)
    }
}

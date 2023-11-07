import Alamofire
import APIManager
import Foundation

class Repository {
    
    private var apiService: APIService
    
    init(apiService: APIService) {
        self.apiService = apiService
    }
    
    func fetch(dataOfFile name: String, fileType: String, completion: @escaping (Data) -> Void) {
        apiService.fetch(fileDataOf: name, fileType: fileType, completion: completion)
    }
}

import Alamofire
import APIManager
import Foundation

protocol APIService {
    func fetch(request: APIRequest, completion: @escaping (Data) -> Void)
    func fetch(fileDataOf name: String, fileType: String, completion: @escaping (Data) -> Void)
}

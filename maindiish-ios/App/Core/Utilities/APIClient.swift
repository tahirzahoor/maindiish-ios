//
//  APIClient.swift
//  maindiish-ios
//
//  Created by Faizan Tanveer on 27/10/2023.
//

import Foundation
import APIManager

class APIClient: APIService {
    func fetch(request: APIRequest, completion: @escaping (Data) -> Void) {
        
    }
    
    func fetch(fileDataOf name: String, fileType: String, completion: @escaping (Data) -> Void) {
        let fileLocation = Bundle.main.path(forResource: "countries_phone_codes_data", ofType: fileType)!
        do {
            let data = try Data(contentsOf: URL(fileURLWithPath: fileLocation), options: .mappedIfSafe)
            completion(data)
        } catch {
            print(error)
        }
    }
}

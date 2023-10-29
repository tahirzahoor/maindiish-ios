//
//  APIService.swift
//  maindiish-ios
//
//  Created by Faizan Tanveer on 27/10/2023.
//

import Alamofire
import APIManager
import Foundation

protocol APIService {
    func fetch(request: APIRequest, completion: @escaping (Data) -> Void)
    func fetch(fileDataOf name: String, fileType: String, completion: @escaping (Data) -> Void)
}

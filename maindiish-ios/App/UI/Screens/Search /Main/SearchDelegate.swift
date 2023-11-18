//
//  SearchDelegate.swift
//  maindiish-ios
//
//  Created by Faizan Tanveer on 18/11/2023.
//

import Foundation

protocol SearchDelegate: AnyObject {
    func filterData(for query: String)
}

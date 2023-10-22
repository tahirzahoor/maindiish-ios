//
//  Fonts.swift
//  BaseCode
//
//  Created by Faizan Tanveer on 18/10/2023.
//

import Foundation
import UIKit

enum Fonts: String {
    
    case poppinsSemibold = "poppins-semibold"
    case workSansMedium = "WorkSans-Medium"
    case interMedium = "Inter-Medium"
    case robotoSemibold = "RobotoCondensed-SemiBold"
    case workSansSemibold = "WorkSans-SemiBold"
    case interSemibold = "Inter-SemiBold"
    case robotoRegular = "Roboto-Regular"
    case interRegular = "Inter-Regular"
    
    func font(_ size: CGFloat = 15) -> UIFont? {
        return UIFont(name: rawValue, size: size)
    }
    
}



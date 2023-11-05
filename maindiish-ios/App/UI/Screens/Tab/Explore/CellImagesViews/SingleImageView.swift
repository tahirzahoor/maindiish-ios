//
//  SingleImageView.swift
//  maindiish-ios
//
//  Created by Faizan Tanveer on 06/11/2023.
//

import UIKit

class SingleImageView: UIView {

    // MARK: - Outlets
    
    @IBOutlet weak var imageView: UIImageView!
    
    // MARK: - Public Methods
    
    func setImages(images: [UIImage]) {
        for image in images {
            imageView.image = image
        }
    }
    
}

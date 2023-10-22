//
//  OnboardingCollectionViewCell.swift
//  BaseCode
//
//  Created by Faizan Tanveer on 18/10/2023.
//

import UIKit

class OnboardingCollectionViewCell: UICollectionViewCell {

    // MARK: - Outlets
    
    @IBOutlet weak var imageView: UIImageView!
    
    // MARK: - Instance Methods
    
    func configureCell(with data: OnboardingDetail) {
        if let image = UIImage(named: data.imageName) {
            imageView.image = image
        }
    }
}

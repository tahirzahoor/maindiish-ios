//
//  BriefCollectionViewController.swift
//  maindiish-ios
//
//  Created by Faizan Tanveer on 18/11/2023.
//

import Foundation
import UIKit

class BriefCollectionViewController: ViewController<BriefCollectionViewModel> {
    
    // MARK: - Outlets
    @IBOutlet weak var briefCollectionView: BriefCollectionView!
    
    
}

extension BriefCollectionViewController: UICollectionViewDelegate {
    
}

extension BriefCollectionViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        <#code#>
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        <#code#>
    }
}


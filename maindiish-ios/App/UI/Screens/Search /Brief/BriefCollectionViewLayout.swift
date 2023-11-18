//
//  BriefCollectionViewLayout.swift
//  maindiish-ios
//
//  Created by Faizan Tanveer on 18/11/2023.
//

import Foundation
import UIKit

class BriefCollectionViewLayout: UICollectionViewCompositionalLayout {
    
    // MARK: - Private Methods
    
    private static func createItem(
        width: NSCollectionLayoutDimension,
        height: NSCollectionLayoutDimension,
        spacing: CGFloat = 0
    ) -> NSCollectionLayoutItem {
        
        let item = NSCollectionLayoutItem(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: width,
                heightDimension: height
            )
        )
        
        item.contentInsets = NSDirectionalEdgeInsets(top: spacing, leading: spacing, bottom: spacing, trailing: spacing)
        
        return item
        
    }
    
    private static func createGroup(
        alignment: LayoutItemAlignment,
        width: NSCollectionLayoutDimension,
        height: NSCollectionLayoutDimension,
        items: [NSCollectionLayoutItem]
    ) -> NSCollectionLayoutGroup {
        switch alignment {
            case .horizontal:
                NSCollectionLayoutGroup.horizontal(
                    layoutSize: NSCollectionLayoutSize(
                        widthDimension: width,
                        heightDimension: height
                    ),
                    subitems: items
                )
            case .vertical:
                NSCollectionLayoutGroup.vertical(
                    layoutSize: NSCollectionLayoutSize(
                        widthDimension: width,
                        heightDimension: height
                    ),
                    subitems: items
                )
        }
    }
    
    private static func createGroup(
        alignment: LayoutItemAlignment,
        width: NSCollectionLayoutDimension,
        height: NSCollectionLayoutDimension,
        item: NSCollectionLayoutItem,
        count: Int = 1
    ) -> NSCollectionLayoutGroup {
        switch alignment {
            case .horizontal:
                NSCollectionLayoutGroup.horizontal(
                    layoutSize: NSCollectionLayoutSize(
                        widthDimension: width,
                        heightDimension: height
                    ),
                    subitem: item,
                    count: count
                )
            case .vertical:
                NSCollectionLayoutGroup.vertical(
                    layoutSize: NSCollectionLayoutSize(
                        widthDimension: width,
                        heightDimension: height
                    ),
                    subitem: item,
                    count: count
                )
        }
    }
    
    // MARK: - Public Methods
   
    static func createLayout() -> UICollectionViewCompositionalLayout {
        
        let mainItem = createItem(width: .fractionalWidth(0.67), height: .fractionalHeight(1), spacing: 4)
        
        let verticalItem = createItem(width: (.fractionalWidth(1)), height: .fractionalHeight(0.5), spacing: 4)
        let verticalRightGroup = createGroup(
            alignment: .vertical,
            width: .fractionalWidth(0.33),
            height: .fractionalHeight(1),
            item: verticalItem,
            count: 2
        )
        
        let topGroup = createGroup(
            alignment: .horizontal,
            width: .fractionalWidth(1),
            height: .fractionalHeight(0.67),
            items: [mainItem, verticalRightGroup]
        )
        
        let secondRowItem = createItem(width: .fractionalWidth(0.33), height: .fractionalHeight(1), spacing: 4)
        let bottomGroup = createGroup(
            alignment: .horizontal,
            width: .fractionalWidth(1),
            height: .fractionalHeight(0.33),
            item: secondRowItem,
            count: 3
        )
        
        let mainGroup = createGroup(
            alignment: .vertical,
            width: .fractionalWidth(1),
            height: .absolute(330),
            items: [topGroup, bottomGroup]
        )
        
        let section = NSCollectionLayoutSection(group: mainGroup)
        
        return UICollectionViewCompositionalLayout(section: section)
    }
}

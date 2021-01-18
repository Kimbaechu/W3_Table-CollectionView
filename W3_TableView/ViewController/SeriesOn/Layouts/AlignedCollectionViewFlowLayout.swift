//
//  AlignedCollectionViewFlowLayout.swift
//  W3_TableView
//
//  Created by Beomcheol Kwon on 2021/01/18.
//

import UIKit

class AlignedCollectionViewFlowLayout: UICollectionViewFlowLayout {
    
    override func prepare() {
        super.prepare()
        
        //        guard let collectionView = collectionView else { return }
        
        self.scrollDirection = .horizontal
        self.minimumInteritemSpacing = 0
    }
    
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        let attributes = super.layoutAttributesForElements(in: rect)?
            .map { $0.copy() } as? [UICollectionViewLayoutAttributes]
        
        attributes?
            .reduce( [CGFloat: (CGFloat, [UICollectionViewLayoutAttributes])]() ) {
                guard $1.representedElementCategory == .cell else { return $0 }
                return $0.merging([ceil($1.center.y): ($1.frame.origin.y, [$1])]) {
                    ($0.0 < $1.0 ? $0.0 : $1.0, $0.1 + $1.1)
                }
            }
            .values.forEach { minY, line in
                line.forEach {
                    $0.frame = $0.frame.offsetBy(
                        dx: 0,
                        dy: minY + $0.frame.origin.y
                    )
                }
            }
        
        return attributes
    }
}

//
//  ColorCollectionViewCell.swift
//  W3_TableView
//
//  Created by Beomcheol Kwon on 2021/01/13.
//

import UIKit
import SnapKit
import Then

class ColorCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "ColorCollectionViewCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        createUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    private func createUI() {
    
    }
    

}


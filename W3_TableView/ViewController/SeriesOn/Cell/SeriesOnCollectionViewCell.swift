//
//  SeriesOnCollectionViewCell.swift
//  W3_TableView
//
//  Created by Beomcheol Kwon on 2021/01/14.
//

import UIKit
import SnapKit
import Then

class SeriesOnCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "SeriesOnCollectionViewCell"
    
    let imageView = UIImageView().then {
        $0.contentMode = .scaleAspectFit
    }
  
    var photo: Photo? {
        didSet {
            if let photo = photo {
                imageView.image = photo.image
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        createUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    private func createUI() {
        contentView.addSubview(imageView)
        
        imageView.snp.makeConstraints {
            $0.edges.equalTo(contentView)
        }
    }
}



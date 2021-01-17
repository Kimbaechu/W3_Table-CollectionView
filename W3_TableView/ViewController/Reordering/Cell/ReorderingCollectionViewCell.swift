//
//  ReorderingCollectionViewCell.swift
//  W3_TableView
//
//  Created by Beomcheol Kwon on 2021/01/14.
//


import UIKit
import SnapKit
import Then

class ReorderingCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "ReorderingCollectionViewCell"
    
    let imageView = UIImageView()
    let indexLabel = UILabel().then {
        $0.font = .boldSystemFont(ofSize: 30)
        $0.textColor = .white
        $0.backgroundColor = .black
    }
    //    let commentLabel = UILabel()
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
        contentView.addSubview(indexLabel)
        
        imageView.snp.makeConstraints {
            $0.edges.equalTo(contentView)
        }
        indexLabel.snp.makeConstraints {
            $0.center.equalTo(contentView)
        }
     
    }
}


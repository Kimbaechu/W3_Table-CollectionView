//
//  ADTableViewCell.swift
//  W3_TableView
//
//  Created by Beomcheol Kwon on 2021/01/13.
//


import UIKit
import SnapKit
import Then

class ADTableViewCell: UITableViewCell {
    
    static let identifier = "ADTableViewCell"
  
    var adView = UIImageView().then {
        $0.layer.cornerRadius = 20
        $0.image = UIImage(named: "ad_1")
        $0.contentMode = .scaleAspectFill
//        $0.layer.masksToBounds = true
        $0.clipsToBounds = true
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        createUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    private func createUI() {
        
        contentView.backgroundColor = .systemRed
        contentView.addSubview(adView)
        let offset: CGFloat = 10
        adView.snp.makeConstraints {
            $0.height.equalTo(100)
//            $0.height.greaterThanOrEqualTo(100)
            $0.edges.equalToSuperview().inset(UIEdgeInsets(top: offset, left: offset, bottom: offset, right: offset))
//            $0.edges.equalTo(contentView).inset(UIEdgeInsets(top: offset, left: offset, bottom: offset, right: offset))
        }
    }
}


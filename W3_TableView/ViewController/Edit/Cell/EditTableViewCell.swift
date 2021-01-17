//
//  EditTableViewCell.swift
//  W3_TableView
//
//  Created by Beomcheol Kwon on 2021/01/13.
//

import UIKit

class EditTableViewCell: UITableViewCell {
  
    static let identifier = "EditTableViewCell"
    
    var colorView = UIView().then {
        $0.layer.cornerRadius = 20
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
       createUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
 
    private func createUI() {
        contentView.addSubview(colorView)
        let offset: CGFloat = 10
        colorView.snp.makeConstraints {
            $0.height.equalTo(50)
//            $0.edges.equalTo(contentView).inset(UIEdgeInsets(top: offset, left: offset, bottom: offset, right: offset))
            $0.edges.equalToSuperview().inset(UIEdgeInsets(top: offset, left: offset, bottom: offset, right: offset))
        }
    }
}


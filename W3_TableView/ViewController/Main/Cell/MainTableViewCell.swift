//
//  MainTableViewCell.swift
//  W3_TableView
//
//  Created by Beomcheol Kwon on 2021/01/13.
//

import UIKit
import SnapKit
import Then

class MainTableViewCell: UITableViewCell {
    
    static let identifier = "MainTableViewCell"
    
    let colorData = createRandomColorData(items: 10)
    
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewLayout()).then {
        
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        layout.itemSize = CGSize(width: 100, height: 100)
        layout.scrollDirection = .horizontal
        $0.collectionViewLayout = layout
        $0.register(ColorCollectionViewCell.self, forCellWithReuseIdentifier: ColorCollectionViewCell.identifier)
        
    }
    
    /// 위와 동일한 결과
    //    lazy var collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout()).then {
    //        $0.register(MainCollectionViewCell.self, forCellWithReuseIdentifier: MainCollectionViewCell.identifier)
    //
    //    }
    //
    //   private func collectionViewLayout() -> UICollectionViewFlowLayout {
    //        let layout = UICollectionViewFlowLayout()
    //        layout.sectionInset = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
    //        layout.itemSize = CGSize(width: 100, height: 100)
    //        layout.scrollDirection = .horizontal
    //
    //        return layout
    //    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        createUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    private func createUI() {
        collectionView.dataSource = self
        collectionView.delegate = self
        
        contentView.backgroundColor = .yellow
        contentView.addSubview(collectionView)
        
        collectionView.snp.makeConstraints {
            $0.height.greaterThanOrEqualTo(110)
            $0.top.left.bottom.right.equalTo(contentView).inset(UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0))
        }
        
    }
}

extension MainTableViewCell: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return colorData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ColorCollectionViewCell.identifier, for: indexPath) as! ColorCollectionViewCell
        
        cell.backgroundColor = colorData[indexPath.item]
        return cell
    }
    
    
}

//
//  SeriesOnViewController.swift
//  W3_TableView
//
//  Created by Beomcheol Kwon on 2021/01/14.
//

import UIKit
import SnapKit
import Then

class SeriesOnViewController: UIViewController {
    
    var photos = Photo.allPhotos()
    var colorData0 = createRandomColorData(items: 5)
    var centerCell: SeriesOnCollectionViewCell?
    
    private var collectionView = UICollectionView(frame: .zero, collectionViewLayout: AlignedCollectionViewFlowLayout()).then {
        
        $0.showsHorizontalScrollIndicator = false
        $0.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        $0.backgroundColor = .darkGray
        $0.register(SeriesOnCollectionViewCell.self, forCellWithReuseIdentifier: SeriesOnCollectionViewCell.identifier)
        print("cell")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createUI()
        collectionView.dataSource = self
        collectionView.delegate = self
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let layoutMargins: CGFloat = self.collectionView.layoutMargins.left + self.collectionView.layoutMargins.right
        let sideInset = (self.view.frame.width / 2) - layoutMargins
        self.collectionView.contentInset = UIEdgeInsets(top: 0, left: sideInset, bottom: 0, right: sideInset)
    }
    private func createUI() {
        self.navigationItem.title = "SeriesOn"
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints {
            $0.top.left.right.equalTo(view.safeAreaLayoutGuide)
            $0.height.equalTo(150)
        }
    }

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
//        guard scrollView is UICollectionView else { return }
        
        let centerPoint = CGPoint(x: self.collectionView.frame.size.width / 2 + scrollView.contentOffset.x,
                                  y:  self.collectionView.frame.size.height / 2 + scrollView.contentOffset.y)
        
       
        
        if let indexPath = self.collectionView.indexPathForItem(at: centerPoint), self.centerCell == nil {
            
            guard let cell = self.collectionView.cellForItem(at: indexPath) as? SeriesOnCollectionViewCell else { return }
            
            self.centerCell = cell
            
            centerCell?.transformToLarge()
            
        }
        
        if let cell = self.centerCell {
            let offsetX = centerPoint.x - cell.center.x
            if offsetX < -50 || offsetX > 50 {
                cell.transformToStandard()
                self.centerCell = nil
            }
        }
    }
}

extension SeriesOnViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return colorData0.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SeriesOnCollectionViewCell.identifier, for: indexPath) as! SeriesOnCollectionViewCell
        cell.backgroundColor = colorData0[indexPath.item]
        cell.alpha = 0
        UIView.animate(withDuration: 1) {
            cell.alpha = 1
        }
        //        cell.photo = photos[indexPath.item]
        return cell
    }
    
}

extension SeriesOnViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let space: CGFloat = 5
        let height = 150 - (space * CGFloat(indexPath.row))
        
        return CGSize(width: 100, height: height)
    }
}

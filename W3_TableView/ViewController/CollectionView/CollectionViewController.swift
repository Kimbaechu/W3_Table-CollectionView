//
//  CollectionViewController.swift
//  W3_TableView
//
//  Created by Beomcheol Kwon on 2021/01/14.
//

import UIKit
import SnapKit
import Then

class CollectionViewController: UIViewController {
    
    var photos = Photo.allPhotos()
    
    private var collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout()).then {
        let flowLayout = UICollectionViewFlowLayout().then {
            $0.scrollDirection = .vertical
        }
        
        $0.collectionViewLayout = flowLayout
        $0.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        $0.backgroundColor = .darkGray
        $0.register(CollectionViewCell.self, forCellWithReuseIdentifier: CollectionViewCell.identifier)
        $0.collectionViewLayout = PinterestLayout()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createUI()
        collectionView.dataSource = self
        collectionView.delegate = self
        
        if let layout = collectionView.collectionViewLayout as? PinterestLayout {
            layout.delegate = self
        }
    }
    
    private func createUI() {
        self.navigationItem.title = "Pinterest"
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints {
            $0.edges.equalTo(view)
        }
        
        print(collectionView.frame)
    }
}

extension CollectionViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCell.identifier, for: indexPath) as! CollectionViewCell
        
        cell.photo = photos[indexPath.item]
        cell.indexLabel.text = "\(indexPath.item)"
        return cell
    }
    
}


extension CollectionViewController: PinterestLayoutDelegate {
    func collectionView(_ collectionView: UICollectionView, heightForPhotoAtIndexPath indexPath: IndexPath) -> CGFloat {
        return photos[indexPath.item].image.size.height
    }
    
    
}
//
//extension CollectionViewController: UICollectionViewDelegateFlowLayout {
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        let itemSize = (collectionView.frame.width - (collectionView.contentInset.left + collectionView.contentInset.right)) / 2
//        print("itemsize", itemSize)
//        return CGSize(width: itemSize, height: itemSize)
//    }
//}

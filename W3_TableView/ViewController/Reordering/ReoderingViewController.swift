//
//  ReoderingViewController.swift
//  W3_TableView
//
//  Created by Beomcheol Kwon on 2021/01/14.
//

import UIKit
import SnapKit
import Then

class ReoderingViewController: UIViewController {
    
    var photos = Photo.allPhotos()
    
    private var collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout()).then {
        let flowLayout = UICollectionViewFlowLayout().then {
            $0.scrollDirection = .vertical
        }
        
        $0.collectionViewLayout = flowLayout
        $0.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        $0.backgroundColor = .darkGray
        $0.register(ReorderingCollectionViewCell.self, forCellWithReuseIdentifier: ReorderingCollectionViewCell.identifier)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createUI()
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.dragDelegate = self
        collectionView.dropDelegate = self
        collectionView.dragInteractionEnabled = true
   
    }
    
    private func createUI() {
        self.navigationItem.title = "Reordering"
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints {
            $0.edges.equalTo(view)
        }
    }
}

extension ReoderingViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ReorderingCollectionViewCell.identifier, for: indexPath) as! ReorderingCollectionViewCell
        
        cell.photo = photos[indexPath.item]
//        cell.indexLabel.text = "\(indexPath.item)"
        print("\(indexPath.row) reuse")
        return cell
    }
    
}

extension ReoderingViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let padding: CGFloat = 5
        let itemsPerRow: CGFloat = 3
        let paddingSpace = padding * (itemsPerRow + 1)
        let availableWidth = view.frame.width - paddingSpace
        let width = availableWidth / itemsPerRow
        
        return CGSize(width: width, height: width * 1.3)
    }
}

extension ReoderingViewController: UICollectionViewDragDelegate {
    func collectionView(_ collectionView: UICollectionView, itemsForBeginning session: UIDragSession, at indexPath: IndexPath) -> [UIDragItem] {
        let object = photos[indexPath.item].image
        
        let item = NSItemProvider(object: object)
        let dragItem = UIDragItem(itemProvider: item)
        return [dragItem]
    }
    
    
}

extension ReoderingViewController: UICollectionViewDropDelegate {
    func collectionView(_ collectionView: UICollectionView, canHandle session: UIDropSession) -> Bool {
      return true
    }
    
    func collectionView(_ collectionView: UICollectionView, performDropWith coordinator: UICollectionViewDropCoordinator) {
        guard let destinationIndexPath = coordinator.destinationIndexPath else {
          return
        }
        
        coordinator.items.forEach { (dropItem) in
            guard let sourceIndexPath = dropItem.sourceIndexPath else {
                return
            }
            collectionView.performBatchUpdates({
                let image = photos[sourceIndexPath.item]
                
                photos.remove(at: sourceIndexPath.item)
                photos.insert(image, at: destinationIndexPath.item)
                collectionView.deleteItems(at: [sourceIndexPath])
                collectionView.insertItems(at: [destinationIndexPath])
            }, completion: { _ in
                coordinator.drop(dropItem.dragItem, toItemAt: destinationIndexPath)
            })
        }
        
        collectionView.reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, dropSessionDidUpdate session: UIDropSession, withDestinationIndexPath destinationIndexPath: IndexPath?) -> UICollectionViewDropProposal {
        
      return UICollectionViewDropProposal(operation: .move, intent: .insertAtDestinationIndexPath)
    }
}

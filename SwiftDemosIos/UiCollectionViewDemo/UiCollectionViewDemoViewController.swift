//
//  UiCollectionViewDemoViewController.swift
//  SwiftDemosIos
//
//  Created by floatingpoint on 7/12/18.
//  Copyright © 2018 HologramPacific. All rights reserved.
//

import Foundation
import UIKit

class UiCollectionViewDemoViewController: UICollectionViewController {
    private let itemsPerRow = CGFloat(3)
    private let sectionInsets = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
    private let cellHorizontalGap = CGFloat(4.0)
    private let minimumLineSpacing = CGFloat(4.0)
    private let minimumInterItemSpacing = CGFloat(0)
    
    /// Map of plantGroup index from cell index. Initially sorted alphabetically.
    private lazy var plantGroupIndexFrom: [Int] = {[unowned self] in
        var result = zip(plantGroups, 0..<plantGroups.count).sorted(by: {$0.0 < $1.0 }).map{$0.1}
        return result
    }()

    override func collectionView(_ collectionView: UICollectionView, canMoveItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination as! PlantGroupPopup
        guard let indexPath = self.collectionView?.indexPath(for: sender as! UICollectionViewCell) else { return }
        destination.plantGroupIndex = plantGroupIndexFrom[indexPath.item]
    }
}

// MARK: - UICollectionViewDataSourceextension
extension UiCollectionViewDemoViewController {
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return plantGroups.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        let imageCell = cell as! CollectionViewImageCell
        
        guard indexPath.item < plantGroupIndexFrom.count  else {
            return
        }
        let plantGroupIndex = plantGroupIndexFrom[indexPath.item]
        
        let plantGroup = plantGroups[plantGroupIndex]
        imageCell.title = plantGroup
        if let image = UIImage(named: plantGroup) {
            imageCell.setBackgroundImage(image)
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TableViewImageCell", for: indexPath)
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView,
                                 moveItemAt sourceIndexPath: IndexPath,
                                 to destinationIndexPath: IndexPath) {
        
        let plantGroupIndex = plantGroupIndexFrom[sourceIndexPath.item]
        plantGroupIndexFrom.remove(at: sourceIndexPath.item)
        plantGroupIndexFrom.insert(plantGroupIndex, at: destinationIndexPath.item)
    }
}

// MARK: - <#UICollectionViewDelegateFlowLayout#>
extension UiCollectionViewDemoViewController : UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return minimumInterItemSpacing
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return minimumLineSpacing
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let horizontalGaps = cellHorizontalGap * (itemsPerRow - 1) + sectionInsets.left + sectionInsets.right

        let availableWidth = collectionView.frame.width - horizontalGaps
        let widthPerItem = availableWidth / (itemsPerRow)
        
        return CGSize(width: widthPerItem, height: widthPerItem)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        return sectionInsets
    }
}

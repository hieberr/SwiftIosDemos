//
//  ImageCell.swift
//  SwiftDemosIos
//
//  Created by floatingpoint on 7/12/18.
//  Copyright © 2018 HologramPacific. All rights reserved.
//
import Foundation
import UIKit

class CollectionViewImageCell : UICollectionViewCell {
    @IBOutlet weak var backgroudImage: UIImageView!
    @IBOutlet weak var label: UILabel!
    
    private var _title = ""
    public var title : String {
        get {
            return _title
        }
        set {
            _title = newValue
            label.text = newValue
        }
    }
    
    public func setBackgroundImage(_ image: UIImage) {
        backgroudImage.image = image
    }
}

//
//  ImageCell.swift
//  SwiftDemosIos
//
//  Created by floatingpoint on 6/25/18.
//  Copyright © 2018 HologramPacific. All rights reserved.
//

import Foundation
import UIKit

class TableViewImageCell : UITableViewCell {
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
        let tintColor = UIColor.black.withAlphaComponent(0.9)
        backgroudImage.tintColor = tintColor
        backgroudImage.image = image
    }
}

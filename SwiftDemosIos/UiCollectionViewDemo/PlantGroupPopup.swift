//
//  PlantGroupPopup.swift
//  SwiftDemosIos
//
//  Created by floatingpoint on 7/13/18.
//  Copyright © 2018 HologramPacific. All rights reserved.
//

import UIKit

class PlantGroupPopup: UIViewController {
    @IBOutlet private weak var backgroundImageView: UIImageView!
    @IBOutlet private weak var popupView: UIView!
    
    @IBAction func onDismissButton(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    public var plantGroupIndex: Int = 0 {
        didSet {
            UpdateBackgroundImage()
        }
    }
    
    private func UpdateBackgroundImage() {
        guard let imageView = backgroundImageView, plantGroupIndex < plantGroups.count else {
            return
        }
        imageView.image = UIImage(named: plantGroups[plantGroupIndex])
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        popupView.layer.cornerRadius = 10.0
        popupView.layer.masksToBounds = true
        UpdateBackgroundImage()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

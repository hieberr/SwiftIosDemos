//
//  ViewController.swift
//  SwiftDemosIos
//
//  Created by floatingpoint on 6/25/18.
//  Copyright © 2018 HologramPacific. All rights reserved.
//

import Foundation
import UIKit

class TableViewDemoTableViewController : UITableViewController {

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return plantGroups.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ImageCell", for: indexPath)
        guard let imageCell : TableViewImageCell = cell as? TableViewImageCell else {
            print("Error: couldn't cast as ImageCell.")
            return cell
        }
        if indexPath.item >= plantGroups.count {
            print("Error: Attempting to make an imageCell for a plant group that doesn't exist.")
                return cell
        }
        let plantGroup = plantGroups[indexPath.row]
        imageCell.title = plantGroup
        if let image = UIImage(named: plantGroup) {
            imageCell.setBackgroundImage(image)
        }else {
            print("Couldn't load image")
        }
        
        return imageCell
    }
}

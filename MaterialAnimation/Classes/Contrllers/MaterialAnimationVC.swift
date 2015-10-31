//
//  MaterialAnimationVC.swift
//  MaterialAnimation
//
//  Created by Oleksandr Nechet on 31.10.15.
//  Copyright © 2015 Oleksandr Nechet. All rights reserved.
//

import UIKit

class MaterialAnimationVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet var buttonLong: UIButton!
    @IBOutlet var buttonShort: UIButton!
    
    //MARK: - TableView
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let identifier = "UITableViewCell"
        let cell = tableView.dequeueReusableCellWithIdentifier(identifier, forIndexPath: indexPath)
        if buttonShort.alpha == 1.0 {
            cell.textLabel?.text = "tap for hide buttons"
        } else {
            cell.textLabel?.text = "tap for show from \(self.titles(forIndex: indexPath.row))"
        }
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 50
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.reloadData()
        if buttonShort.alpha == 1.0 {
            buttonShort.alpha = 0;
            buttonLong.alpha = 0;
        }else{
            buttonShort.alpha = 1.0
            buttonLong.alpha = 1
            let startPointLongButton = self.animationStartPoint(forRect: buttonLong.frame, index: indexPath.row)
            let startPointShortButton = self.animationStartPoint(forRect: buttonShort.frame, index: indexPath.row)
            buttonShort.materialAnimationShow(withStartPoint: startPointShortButton)
            buttonLong.materialAnimationShow(withStartPoint: startPointLongButton)
        }
    }
    
    //MARK: - Helpers
    
    func titles(forIndex index: Int) -> String {
        switch index % 5 {
        case 0:
            return "left top corner"
        case 1:
            return "left bottom corner"
        case 2:
            return "right bottom corner"
        case 3:
            return "right top corner"
        case 4:
            return "center"
        default:
            return "unknown"
        }
    }
    
    func animationStartPoint(forRect frame: CGRect, index:Int) -> CGPoint {
        var startPoint = CGPointZero
        switch index % 5 {
        case 1:
            startPoint.y = frame.size.height

        case 2:
            startPoint.y = frame.size.height
            startPoint.x = frame.size.width
        case 3:
            startPoint.x = frame.size.width
        case 4:
            startPoint.y = frame.size.height / 2.0
            startPoint.x = frame.size.width / 2.0
        default:
            break
        }
        return startPoint
    }
}



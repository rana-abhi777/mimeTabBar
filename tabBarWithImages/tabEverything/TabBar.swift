//
//  TabBar.swift
//  tabBarWithImages
//
//  Created by Aseem 14 on 05/06/17.
//  Copyright © 2017 Code-Brew Labs. All rights reserved.
//

import Foundation
import UIKit

class TabBar : UIView {
    func createTabBar(width: Int, count: Int) {
        let widthSet = width / count
        var xPosition = 0
        let yPosition = 0
        
        for i in 0..<count {
            let button = UIButton()
            button.frame = (frame: CGRect(x: xPosition, y: yPosition, width: widthSet, height: Int(self.frame.size.height)))
            button.backgroundColor = UIColor.red
            button.titleLabel?.textColor = UIColor.white
            button.tag = i
            button.setTitle(" home ", for: .normal)
            button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
            self.addSubview(button)
            xPosition += widthSet
        }
    }
    func buttonAction(sender: UIButton!) {
        switch sender.tag {
        case 0:
            
        case 1:
        case 2:
        case 4:
        default: break
        }
    }
}
extension TabBar {
//    @IBInspectable var cornerRadius: CGFloat = 0 {
//        didSet {
//            layer.cornerRadius = cornerRadius
//            layer.masksToBounds = cornerRadius > 0
//        }
//    }
}

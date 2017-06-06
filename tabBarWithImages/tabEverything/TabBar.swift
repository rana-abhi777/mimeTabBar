//
//  TabBar.swift
//  tabBarWithImages
//
//  Created by Aseem 14 on 05/06/17.
//  Copyright © 2017 Code-Brew Labs. All rights reserved.
//

import Foundation
import UIKit
import EZSwiftExtensions

class TabBar : UIView {
    //MARK: VARIABLES
    var backGroundColor = UIColor()
    var delegate: DelegateTab?
    //MARK: FUNCTIONS
    init () {
        super.init()
        
        delegate = self
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func changeSelectedBackground(_ selectedIndex: Int) {
        for view in self.subviews as [UIView] {
            if let btn = view as? UIButton {
                if btn.tag == selectedIndex {
                    btn.backgroundColor = backGroundColor.withAlphaComponent(0.5)
                }
                else {
                    btn.backgroundColor = backGroundColor
                }
            }
        }
    }
    
    func addButtons(tabNames: [String], tabCount: Int) {
        let widthSet = Int(self.frame.size.width) / 4
        var xPosition = 0
        let yPosition = 0
        
        
        for i in 0..<4 {
            let button = UIButton()
            button.frame = (frame: CGRect(x: xPosition, y: yPosition, width: widthSet, height: Int(self.frame.size.height)))
            //            button.backgroundColor = UIColor.white
            button.titleLabel?.textColor = UIColor.white
            button.titleLabel?.adjustsFontSizeToFitWidth = true
            button.tag = i
            button.setImage(UIImage(named: "\(tabNames[i]).png"), for: .normal)
            button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
            self.addSubview(button)
            xPosition += widthSet
        }
        
    }
    func buttonAction(sender: UIButton!) {
        print(sender.tag)
        changeSelectedBackground(sender.tag)
//        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
//
//        switch sender.tag {
//        case 0:
//            guard let homeVC = storyBoard.instantiateViewController(withIdentifier: "homeViewController") as? homeViewController else { return }
//            self.addChildViewController(homeVC)
//            contentViewVC.addSubview(homeVC.view)
//            
//        case 1:
//            guard let homeVC = storyBoard.instantiateViewController(withIdentifier: "picsViewController") as? picsViewController else { return }
//            self.addChildViewController(homeVC)
//            contentViewVC.addSubview(homeVC.view)
//            
//        case 2:
//            guard let homeVC = storyBoard.instantiateViewController(withIdentifier: "profileViewController") as? profileViewController else { return }
//            self.addChildViewController(homeVC)
//            contentViewVC.addSubview(homeVC.view)
//            
//        case 3:
//            guard let homeVC = storyBoard.instantiateViewController(withIdentifier: "cardboardViewController") as? cardboardViewController else { return }
//            self.addChildViewController(homeVC)
//            contentViewVC.addSubview(homeVC.view)
//            
//        default: break
//        }
//        self.view.bringSubview(toFront: self)
//    }
    
    }
}

//MARK: DELEGATE
extension TabBar: DelegateTab {
    func keepTabCount(selectedIndex: Int) {}
    
    func fetchData(tabNames: [String], tabCount: Int, r: Int, g: Int, b: Int, a: Int) {
        addButtons(tabNames: tabNames, tabCount: tabCount)
        backGroundColor = UIColor(red: CGFloat(r), green: CGFloat(g), blue: CGFloat(b), alpha: CGFloat(1))
    }
}

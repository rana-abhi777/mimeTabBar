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
    var count: Int?
    var imageNames = [String]()
    var tabController = TabControllers()
    //    var framePassed: CGRect?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        //self.addRoundedBlur()
        self.addButtons(framePassed: frame)
    }
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        //self.addRoundedBlur()
        self.addButtons(framePassed: frame)
    }
    
    // MARK: - Initializers
    //    override init(){
    //        super.init()
    //    }
    //
    //    override init(frame: CGRect) {
    //        super.init(frame: frame)
    //
    //    }
    //
    //    required public init(coder aDecoder: NSCoder) {
    //        fatalError("init(coder:) has not been implemented")
    //    }
    
    
    //MARK: FUNCTIONS
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
    
    func addButtons(framePassed: CGRect) {
        
        let widthSet = (framePassed.size.width) / 4
        var xPosition: Double = 0.0
        let yPosition: Double = 0.0
        backGroundColor = UIColor(r: 137, g: 183, b: 163)
        let imageNames = ["home", "cardboard", "message", "me"]
        for i in 0..<4 {
            let button = UIButton()
            button.frame = (frame: CGRect(x: xPosition, y: yPosition, width: Double(widthSet), height: Double(self.frame.size.height)))
            button.backgroundColor = backGroundColor
            //            button.titleLabel?.textColor = UIColor.white
            //            button.titleLabel?.adjustsFontSizeToFitWidth = true
            button.tag = i
            button.setImage(UIImage(named: "\(imageNames[i]).png"), for: .normal)
            button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
            self.addSubview(button)
            xPosition += Double(widthSet)
        }
        
    }
    func buttonAction(sender: UIButton!) {
//        print(sender.tag)
        changeSelectedBackground(sender.tag)
        
//        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "selectedVC"),
//                                        object: sender.tag,
//                                        userInfo: nil)
        tabController.setVC(selectedIndex: sender.tag)
    }
    

}

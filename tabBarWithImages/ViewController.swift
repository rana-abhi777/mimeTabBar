//
//  ViewController.swift
//  tabBarWithImages
//
//  Created by Aseem 14 on 05/06/17.
//  Copyright © 2017 Code-Brew Labs. All rights reserved.
//

import UIKit
import EZSwiftExtensions
class ViewController: UIViewController, UITableViewDelegate {
    
    //MARK: OUTLETS
    @IBOutlet var viewTab: UIView!
    @IBOutlet var contentViewVC: UIView!
    //MARK: VARIABLES
    var delegate: DelegateTab?
    var selectedIndex = 0
    
    //MARK: FUNCTIONS
    func changeSelectedBackground(_ selectedIndex: Int) {
        for view in self.viewTab.subviews as [UIView] {
            if let btn = view as? UIButton {
                if btn.tag == selectedIndex {
                    btn.backgroundColor = UIColor(r: 255, g: 240, b: 240, a: 0.5)
                }
                else {
                    btn.backgroundColor = UIColor.white
                }
            }
        }
    }
    func addButtons() {
        let widthSet = Int(viewTab.frame.size.width) / 4
        var xPosition = 0
        let yPosition = 0
        let imageName = ["home", "cardboard", "message", "me"]
        
        for i in 0..<4 {
            let button = UIButton()
            button.frame = (frame: CGRect(x: xPosition, y: yPosition, width: widthSet, height: Int(viewTab.frame.size.height)))
            //            button.backgroundColor = UIColor.white
            button.titleLabel?.textColor = UIColor.white
            button.titleLabel?.adjustsFontSizeToFitWidth = true
            button.tag = i
            button.setImage(UIImage(named: "\(imageName[i]).png"), for: .normal)
            button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
            viewTab.addSubview(button)
            xPosition += widthSet
        }
        
    }
    func buttonAction(sender: UIButton!) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        changeSelectedBackground(sender.tag)
        switch sender.tag {
        case 0:
            guard let homeVC = storyBoard.instantiateViewController(withIdentifier: "homeViewController") as? homeViewController else { return }
            self.addChildViewController(homeVC)
            contentViewVC.addSubview(homeVC.view)
            
        case 1:
            guard let homeVC = storyBoard.instantiateViewController(withIdentifier: "picsViewController") as? picsViewController else { return }
            self.addChildViewController(homeVC)
            contentViewVC.addSubview(homeVC.view)
            
        case 2:
            guard let homeVC = storyBoard.instantiateViewController(withIdentifier: "profileViewController") as? profileViewController else { return }
            self.addChildViewController(homeVC)
            contentViewVC.addSubview(homeVC.view)
            
        case 3:
            guard let homeVC = storyBoard.instantiateViewController(withIdentifier: "cardboardViewController") as? cardboardViewController else { return }
            self.addChildViewController(homeVC)
            contentViewVC.addSubview(homeVC.view)
            
        default: break
        }
        self.view.bringSubview(toFront: viewTab)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        addButtons()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}


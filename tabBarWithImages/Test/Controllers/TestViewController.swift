//
//  TestViewController.swift
//  tabBarWithImages
//
//  Created by Aseem 14 on 06/06/17.
//  Copyright © 2017 Code-Brew Labs. All rights reserved.
//

import UIKit

class TestViewController: UIViewController {

    //MARK:OUTLETS
    @IBOutlet var viewTabs: TabBar!
    
    @IBOutlet var containerView: UIView!
    //MARK:VARIABLES
    var tabBar: TabBar?
    let imageNames = ["home", "cardboard", "message", "me"]
    let tabs = 4
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
//        tabBar?.addButtons(tabNames: imageNames, tabCount: imageNames.count, r: 255, g: 240, b: 240, a: 1)
        tabBar?.imageNames = self.imageNames
        
        tabBar = TabBar(frame: viewTabs.frame)
        NotificationCenter.default.addObserver(self, selector: #selector(TestViewController.changeVC), name: NSNotification.Name(rawValue: "selectedVC"), object: nil)
        
//        tabBar?.addButtons()
    }
    func changeVC(not: Notification) {
        if let selectedIndex = not.object as? Int {
            let storyboard = UIStoryboard(name: "Test", bundle: nil)
            switch selectedIndex {
            case 0:
                guard let homeVC = storyboard.instantiateViewController(withIdentifier: "Tab1ViewController") as? Tab1ViewController else { return }
                self.addChildViewController(homeVC)
                containerView.addSubview(homeVC.view)
                
            case 1:
                guard let homeVC = storyboard.instantiateViewController(withIdentifier: "Tab2ViewController") as? Tab2ViewController else { return }
                self.addChildViewController(homeVC)
                containerView.addSubview(homeVC.view)
                
            case 2:
                guard let homeVC = storyboard.instantiateViewController(withIdentifier: "Tab3ViewController") as? Tab3ViewController else { return }
                self.addChildViewController(homeVC)
                containerView.addSubview(homeVC.view)
                
//            case 3:
//                guard let homeVC = storyboard.instantiateViewController(withIdentifier: "cardboardViewController") as? cardboardViewController else { return }
//                self.addChildViewController(homeVC)
//                containerView.addSubview(homeVC.view)
                
            default: break
            }
            self.view.bringSubview(toFront: viewTabs)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

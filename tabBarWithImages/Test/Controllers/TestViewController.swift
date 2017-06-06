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
    
    //MARK:VARIABLES
    var delegateForTabs: DelegateTab?
    let imageNames = ["home", "cardboard", "message", "me"]
    let tabs = 4
    var tabBar: TabBar = TabBar()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Do any additional setup after loading the view.
        
        delegateForTabs?.fetchData(tabNames: imageNames, tabCount: tabs, r: 255, g: 240, b: 240, a: 1)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

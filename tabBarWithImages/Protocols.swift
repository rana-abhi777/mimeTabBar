//
//  Protocols.swift
//  tabBarWithImages
//
//  Created by Aseem 14 on 05/06/17.
//  Copyright © 2017 Code-Brew Labs. All rights reserved.
//

import Foundation

@objc protocol DelegateTab: class {
    @objc optional func keepTabCount(selectedIndex: Int)
    func fetchData(tabNames: [String], tabCount: Int, r: Int, g: Int, b: Int, a: Int)
    
}

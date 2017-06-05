//
//  ViewController.swift
//  tabBarWithImages
//
//  Created by Aseem 14 on 05/06/17.
//  Copyright © 2017 Code-Brew Labs. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

//MARK: OUTLETS
    @IBOutlet var viewTab: UIView!
    @IBOutlet var contentViewVC: UIView!
//MARK: VARIABLES
    
//MARK: FUNCTIONS
    func addButtons(width: Int, count: Int) {
        
        let widthSet = width / count
        var xPosition = 0
        let yPosition = 0
        
        for i in 0..<count {
            let button = UIButton()
            button.frame = (frame: CGRect(x: xPosition, y: yPosition, width: widthSet, height: Int(viewTab.frame.size.height)))
            button.backgroundColor = UIColor.red
            button.titleLabel?.textColor = UIColor.white
            button.layer.borderColor = UIColor.white.cgColor
            button.layer.borderWidth = 0.5
            button.tag = i
            button.setTitle(" home ", for: .normal)
            button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
            viewTab.addSubview(button)
            xPosition += widthSet
        }
    }
    func buttonAction(sender: UIButton!) {
        print(sender.tag)
        if sender.tag%2 == 0 {
            
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        addButtons(width: Int(viewTab.frame.size.width), count: 5)
//        addButtons()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


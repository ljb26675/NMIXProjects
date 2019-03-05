//
//  ViewController.swift
//  Tab Bars
//
//  Created by Linsey Briley on 2/5/19.
//  Copyright © 2019 Linsey Briley. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITabBarDelegate {

    @IBOutlet var christine: UITabBar!
    @IBOutlet var myPic: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        christine.delegate = self
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem){
        if item.tag == 1{
            myPic.image = UIImage(named: "bigboy.jpg")
        }
        if item.tag == 2{
            myPic.image = UIImage(named: "beach.jpg")
        }
    }


}


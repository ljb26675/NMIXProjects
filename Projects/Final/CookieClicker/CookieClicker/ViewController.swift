//
//  ViewController.swift
//  CookieClicker
//
//  Created by Linsey Briley on 4/30/19.
//  Copyright © 2019 AppCoda. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    var numClicks = 0
    @IBOutlet var text: UILabel!
    @IBAction func click() {
        numClicks+=1
        text.text = String(numClicks) + " clicks!"
    }
    
}


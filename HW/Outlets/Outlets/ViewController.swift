//
//  ViewController.swift
//  Outlets
//
//  Created by Linsey Briley on 1/15/19.
//  Copyright © 2019 Linsey Briley. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    
    @IBOutlet weak var myText: UITextField!
    @IBAction func myButton() {
        myText.text = "Hello World again"
        
    }
    
    override func viewDidLoad() {
        
        
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
}


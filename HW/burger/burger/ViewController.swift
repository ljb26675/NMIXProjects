//
//  ViewController.swift
//  burger
//
//  Created by Linsey Briley on 4/9/19.
//  Copyright © 2019 AppCoda. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    var seeBurger = false
    
    @IBOutlet var mainView: UIView!
    @IBOutlet var buttonStack: UIStackView!
    
    @IBAction func magenta() {
        mainView.backgroundColor = UIColor.magenta
    }
    
    @IBAction func red() {
        
        mainView.backgroundColor = UIColor.red
    }
    
    @IBAction func orange() {
        
        mainView.backgroundColor = UIColor.orange
        
    }
    @IBAction func burgerControl(_ sender: Any) {
        
        if !seeBurger {
            UIStackView.animate(withDuration: 1, animations: {self.buttonStack.alpha = 1})
        }else{
            UIStackView.animate(withDuration: 1, animations: {self.buttonStack.alpha = 0})
        }
        seeBurger = !seeBurger
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
}


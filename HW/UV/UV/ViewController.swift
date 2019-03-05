//
//  ViewController.swift
//  UV
//
//  Created by Linsey Briley on 1/24/19.
//  Copyright © 2019 Linsey Briley. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var Label: UILabel!
    override func viewDidAppear(_ animated: Bool) {
        
        Label.text = topic;
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


}


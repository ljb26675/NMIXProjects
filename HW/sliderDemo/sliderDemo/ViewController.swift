//
//  ViewController.swift
//  sliderDemo
//
//  Created by Linsey Briley on 2/19/19.
//  Copyright © 2019 AppCoda. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var smallBox: UIView!
    @IBOutlet var slyder: UISlider!
    @IBAction func tellMe(_ sender: Any) {
        slydeData.text = "\(slyder.value)"
        let  howbig = CGFloat (slyder.value * 5)
        smallBox.transform = CGAffineTransform(scaleX: howbig, y: howbig)
        
    }
    @IBOutlet var slydeData: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


}


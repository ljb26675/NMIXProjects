//
//  ViewController.swift
//  Assignment1
//
//  Created by Linsey Briley on 2/7/19.
//  Copyright © 2019 AppCoda. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var array1 = 1
    var array2 = 2
    
    var num = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    //segue function to pass the values
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let  receiverView = segue.destination as! ViewController2
        //receiverView.passedNum = num
        receiverView.passedNum = segue.identifier ?? String()
    }


}



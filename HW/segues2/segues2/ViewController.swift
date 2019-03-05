//
//  ViewController.swift
//  segues2
//
//  Created by Linsey Briley on 1/31/19.
//  Copyright © 2019 Linsey Briley. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    var testVar = "it worked"
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let receiverView = segue.destination as! SegueViewController;
        //receiverView.passedIt = testVar
        if segue.identifier == "segue1"{
            receiverView.passedIt = "from first button!"
        }
        if segue.identifier == "segue2"{
            receiverView.passedIt = "from second button!"
        }
        if segue.identifier == "segue3"{
            receiverView.passedIt = "from third button!"
        }
    }


}


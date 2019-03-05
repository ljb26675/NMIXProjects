//
//  SegueViewController.swift
//  segues2
//
//  Created by Linsey Briley on 1/31/19.
//  Copyright © 2019 Linsey Briley. All rights reserved.
//

import UIKit

class SegueViewController: UIViewController {
    
    var passedIt = String() //empty string

    @IBOutlet var passedVariable: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        passedVariable.text = passedIt;
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

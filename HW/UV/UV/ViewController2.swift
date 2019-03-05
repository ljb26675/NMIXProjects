//
//  ViewController2ViewController.swift
//  UV
//
//  Created by Linsey Briley on 1/24/19.
//  Copyright © 2019 Linsey Briley. All rights reserved.
//

import UIKit

class ViewController2: UIViewController {

    @IBOutlet weak var newVar: UITextField!
    @IBAction func didEdit(_ sender: Any) {
        topic = newVar.text!
    }
    override func viewDidLoad() {
        super.viewDidLoad()

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

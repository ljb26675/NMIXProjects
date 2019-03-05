//
//  ViewController.swift
//  PictureSegue
//
//  Created by Linsey Briley on 1/31/19.
//  Copyright © 2019 Linsey Briley. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let passedPic = segue.destination as! displayPix;
        
        if segue.identifier == "beach"{
            passedPic.picChosen = "beach.jpg"
        }
        if segue.identifier == "big boy"{
            passedPic.picChosen = "bigboy.jpg"
        }
        if segue.identifier == "butterfly"{
            passedPic.picChosen = "butterfly.jpg"
        }
        if segue.identifier == "tree"{
            passedPic.picChosen = "tree.jpg"
        }
        
        
    }

}


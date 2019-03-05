//
//  ViewController.swift
//  Slideshow
//
//  Created by Linsey Briley on 2/7/19.
//  Copyright © 2019 AppCoda. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var pico = ["one.jpg", "two.jpg", "three.jpg", "four.jpg", "five.jpg"]
    var currentPicture = 0;
    
    @IBOutlet var show: UIImageView!
    func showPico(){
        let displayPic = UIImage(named: pico[currentPicture])
            show.image = displayPic
    }
    
    @IBAction func previous() {
        if currentPicture != 0{
            currentPicture-=1
        }else{
            currentPicture = 4
        }
        showPico()
    }
    
    @IBAction func next() {
        if currentPicture != 4{
            currentPicture+=1
        } else{
            currentPicture = 0
        }
        showPico()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        showPico()
        
        // Do any additional setup after loading the view, typically from a nib.
    }


}


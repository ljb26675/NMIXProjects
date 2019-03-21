//
//  ViewController.swift
//  DatabaseOne
//
//  Created by Linsey Briley on 3/21/19.
//  Copyright © 2019 AppCoda. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var dataValues: NSArray = []
    var candidates = 0
    
    @IBOutlet var tellMe: UILabel!
    

    @IBAction func cycle() {
        loadData(whichCandidate: candidates)
        candidates+=1
        if candidates == dataValues.count{
            candidates = 0
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData(whichCandidate: candidates)
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func loadData(whichCandidate: Int){
        let dataUrl = NSURL(string: "http://emuel.mynmi.net/db/xCandidates.php")
        let theData = NSData(contentsOf: dataUrl! as URL)
        dataValues = try! JSONSerialization.jsonObject(with: theData! as Data, options: JSONSerialization.ReadingOptions.mutableContainers) as! NSArray
        //let dataLine = dataValues[0]
        let dataLine = dataValues[whichCandidate]
        tellMe.text = (dataLine as AnyObject)["first_name"] as? String
        
        let test = (dataLine as AnyObject)["last_name"] as? String
        tellMe.text?.append(" ")
        tellMe.text?.append(test as! String)
    }

}


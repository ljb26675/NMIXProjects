//
//  ViewController.swift
//  Midterm
//
//  Created by Linsey Briley on 3/26/19.
//  Copyright © 2019 AppCoda. All rights reserved.
//

import UIKit
import WebKit


class ViewController: UIViewController {
    
    var dataValues: NSArray = []
    var candidates = 0

    @IBOutlet var catName: UILabel!
    @IBOutlet var catAttit: UILabel!
    
    //@IBOutlet var picView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData(whichCandidate: candidates)
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func prev() {
        if candidates == 0 {
            candidates = dataValues.count-1
        }else{
            candidates-=1
        }
        loadData(whichCandidate: candidates)
    }
    
    @IBAction func next() {
        if candidates == dataValues.count-1 {
            candidates = 0
        } else{
            candidates+=1
        }
        loadData(whichCandidate: candidates)
    }
    
    func loadData(whichCandidate: Int){
        let dataUrl = NSURL(string: "https://api.thecatapi.com/v1/breeds?api_key=9925340a-d1d0-48ce-88d5-31bda78cb13e")
        /*let dataUrl = NSMutableURLRequest(url:NSURL(string: "https://api.thecatapi.com/v1/breeds?")! as URL)
        dataUrl.addValue("9925340a-d1d0-48ce-88d5-31bda78cb13e", forHTTPHeaderField: "X-Auth-Token")
        dataUrl.httpMethod = "GET" // or POST or whatever*/
        let theData = NSData(contentsOf: dataUrl! as URL)
        dataValues = try! JSONSerialization.jsonObject(with: theData! as Data, options: JSONSerialization.ReadingOptions.mutableContainers) as! NSArray
        //let dataLine = dataValues[0]
        let dataLine = dataValues[whichCandidate]
        
        catName.text = (dataLine as AnyObject)["name"] as? String
        
        catAttit.text = (dataLine as AnyObject)["temperament"] as? String
    
        
        
        
        /* load the url into webkitview */
        //picView.load(NSURLRequest(url: NSURL(string: (dataLine as AnyObject)["wikipedia_url"] as! String)! as URL) as URLRequest)
        
        /* load url contents into a label */
        //label.text = (dataLine as AnyObject)["wikipedia_url"] as? String
    }



}


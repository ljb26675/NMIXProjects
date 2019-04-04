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
    var picValues: NSArray = []
    var candidates = 0
    
    var curRow = 0

    @IBOutlet var catName: UILabel!
    
    @IBOutlet var catDes: UITextView!
    
    
    @IBOutlet var picView: WKWebView!
    @IBOutlet var picText: UITextView!
    
    @IBOutlet var catAttit: UITextView!
    
    
    
    @IBOutlet var prevButton: UIBarButtonItem!
    @IBOutlet var moreButton: UIBarButtonItem!
    @IBOutlet var nextButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData(whichCandidate: curRow)
       
    }
    
    @IBAction func previousCat(_ sender: Any) {
        if curRow == 0 {
            curRow = dataValues.count-1
        }else{
            curRow-=1
        }
        loadData(whichCandidate: curRow)
    }
    
    @IBAction func nextCat(_ sender: Any) {
        if curRow == dataValues.count-1 {
            curRow = 0
        } else{
            curRow+=1
        }
        loadData(whichCandidate: curRow)
    }
    
    func loadData(whichCandidate: Int){
        
        
        //DATA URL WITH API KEY
        let dataUrl = NSURL(string: "https://api.thecatapi.com/v1/breeds?api_key=9925340a-d1d0-48ce-88d5-31bda78cb13e")
        let theData = NSData(contentsOf: dataUrl! as URL)
        dataValues = try! JSONSerialization.jsonObject(with: theData! as Data, options: JSONSerialization.ReadingOptions.mutableContainers) as! NSArray
        let dataLine = dataValues[whichCandidate]
        
        catName.text = (dataLine as AnyObject)["name"] as? String
        catDes.text = (dataLine as AnyObject)["description"] as? String
        catAttit.text = (dataLine as AnyObject)["temperament"] as? String
        
        let breedId = (dataLine as AnyObject)["id"] as? String
        
        //URL FOR PICTURE, FOUND WITH CAT'S BREED ID
        let url1 = "https://api.thecatapi.com/v1/images/search?breed_id=" + breedId!
        
        let url2 = url1 + "&api_key=9925340a-d1d0-48ce-88d5-31bda78cb13e"
        
        let picUrl = NSURL(string: url2)
        
        let picData = NSData(contentsOf: picUrl! as URL)
        
        picValues = try! JSONSerialization.jsonObject(with: picData! as Data, options: JSONSerialization.ReadingOptions.mutableContainers) as! NSArray
        let picLine = picValues[0]
        
        
        let picCat = (picLine as AnyObject)["url"] as? String
        
        //LOAD PIC OF CAT
        picView.load(NSURLRequest(url: NSURL(string: picCat!)! as URL) as URLRequest)
        
        
    }
    
    /*SEND CUR VIEW TO OTHER SEGUE*/
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "info"{
            let destinationViewController = segue.destination as! ViewController2
            
            destinationViewController.dataValues = dataValues
                destinationViewController.curRow = curRow
            
        }
    }



}


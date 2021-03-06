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
   // @IBOutlet var temperament: UILabel!
    //@IBOutlet var origin: UILabel!
    //@IBOutlet var catAttit: UILabel!
    
    @IBOutlet var catDes: UITextView!
    
    //@IBOutlet var catOrig: UITextView!
    
    @IBOutlet var picView: WKWebView!
    @IBOutlet var picText: UITextView!
    //@IBOutlet var picView: WKWebView!
    
    @IBOutlet var catAttit: UITextView!
    
    
    
    @IBOutlet var prevButton: UIBarButtonItem!
    @IBOutlet var moreButton: UIBarButtonItem!
    @IBOutlet var nextButton: UIBarButtonItem!
    
    //@IBOutlet var moreInfo: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData(whichCandidate: curRow)
        /*prevButton.setTitleTextAttributes([
            NSAttributedString.Key.font : UIFont(name: "System", size: 26)!,
            NSAttributedString.Key.foregroundColor : UIColor.white,
            ], for: .normal)*/
        // Do any additional setup after loading the view, typically from a nib.
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
        
        
        let dataUrl = NSURL(string: "https://api.thecatapi.com/v1/breeds?api_key=9925340a-d1d0-48ce-88d5-31bda78cb13e")
        let imag1 = "https://www.google.com/search?q="
        //scottishfold
        let imag2 = "&safe=strict&source=lnms&tbm=isch&sa=X&ved=0ahUKEwikmMGTlqHhAhUinuAKHZ5WAFcQ_AUIDigB&biw=1200&bih=822"
        /*let dataUrl = NSMutableURLRequest(url:NSURL(string: "https://api.thecatapi.com/v1/breeds?")! as URL)
        dataUrl.addValue("9925340a-d1d0-48ce-88d5-31bda78cb13e", forHTTPHeaderField: "X-Auth-Token")
        dataUrl.httpMethod = "GET" // or POST or whatever*/
        let theData = NSData(contentsOf: dataUrl! as URL)
        dataValues = try! JSONSerialization.jsonObject(with: theData! as Data, options: JSONSerialization.ReadingOptions.mutableContainers) as! NSArray
        //let dataLine = dataValues[0]
        let dataLine = dataValues[whichCandidate]
        
        catName.text = (dataLine as AnyObject)["name"] as? String
        catDes.text = (dataLine as AnyObject)["description"] as? String
        catAttit.text = (dataLine as AnyObject)["temperament"] as? String
        //moreInfo.text = "Want to know more about the " + catName.text! + "? Press the info button below!"
        
        //catOrig.text = (dataLine as AnyObject)["origin"] as? String
        let breedId = (dataLine as AnyObject)["id"] as? String
        
        let url1 = "https://api.thecatapi.com/v1/images/search?breed_id=" + breedId!
        
        let url2 = url1 + "&api_key=9925340a-d1d0-48ce-88d5-31bda78cb13e"
        
        let picUrl = NSURL(string: url2)
        
        let picData = NSData(contentsOf: picUrl! as URL)
        
        picValues = try! JSONSerialization.jsonObject(with: picData! as Data, options: JSONSerialization.ReadingOptions.mutableContainers) as! NSArray
        //let dataLine = dataValues[0]
        let picLine = picValues[0]
        
        
        let picCat = (picLine as AnyObject)["url"] as? String
        
        
        //https://api.thecatapi.com/v1/images/search?breed_id=abys
        
        
        /* load the url into webkitview */
        //picView.load(NSURLRequest(url: NSURL(string: (dataLine as AnyObject)["wikipedia_url"] as! String)! as URL) as URLRequest)
        //let picUrl = imag1 + ((dataLine as AnyObject)["name"] as! String) + imag2
        
        picView.load(NSURLRequest(url: NSURL(string: picCat!)! as URL) as URLRequest)
        //picText.text = picCat
        
        /* load url contents into a label */
        //label.text = (dataLine as AnyObject)["wikipedia_url"] as? String
        
        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "info"{
            let destinationViewController = segue.destination as! ViewController2
            //let myIndexPath = self.tableView.indexPathForSelectedRow
            //let myRow = myIndexPath!.row
            /*destinationViewController.myText = textForNewVieW[myRow]
             destinationViewController.myLabel = myDataForTable[myRow]
             destinationViewController.myImage = bigPixForView[myRow]*/
            
            destinationViewController.dataValues = dataValues
                destinationViewController.curRow = curRow
            
        }
    }



}


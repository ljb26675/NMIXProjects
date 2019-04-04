//
//  ViewController2.swift
//  Midterm
//
//  Created by Linsey Briley on 3/27/19.
//  Copyright © 2019 AppCoda. All rights reserved.
//

import UIKit

class ViewController2: UIViewController {

    
    var dataValues: NSArray = []
    
    var curRow = 0
    
    @IBOutlet var intell: UILabel!
    @IBOutlet var affection: UILabel!
    @IBOutlet var grooming: UILabel!
    @IBOutlet var health: UILabel!
    @IBOutlet var life: UILabel!
    override func viewDidLoad() {
        
        loadData(whichCandidate: curRow)
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func loadData(whichCandidate: Int){
        
        //URL TO GET DATA WITH API KEY
        let dataUrl = NSURL(string: "https://api.thecatapi.com/v1/breeds?api_key=9925340a-d1d0-48ce-88d5-31bda78cb13e")
        let theData = NSData(contentsOf: dataUrl! as URL)
        dataValues = try! JSONSerialization.jsonObject(with: theData! as Data, options: JSONSerialization.ReadingOptions.mutableContainers) as! NSArray
        
        let dataLine = dataValues[whichCandidate]
        
        
        //SET TEXT
        isIntell(cat: ((dataLine as AnyObject)["intelligence"] as? Int)!)
        isAffect(cat: ((dataLine as AnyObject)["affection_level"] as? Int)!)
        grooming(cat: ((dataLine as AnyObject)["grooming"] as? Int)!)
        health(cat: ((dataLine as AnyObject)["health_issues"] as? Int)!)
        
        life.text = ((dataLine as AnyObject)["life_span"] as? String)! + " years"
        
        
        
    }
    
    
    /* DEPENDING ON NUM, THEY RETURN A STRING*/
    func isIntell(cat: Int){
        var text = ""
        switch cat {
            case 1:
                text = "Not the sharpest "
            case 2:
                text = "Got a lil smarts"
            case 3:
                text = "Average"
            case 4:
                text = "Above average"
            case 5:
                text = "Extremely!"
            default:
                text = ""
        }
        intell.text = text
        
        
    }
    func isAffect(cat: Int){
        
        var text = ""
        switch cat {
        case 1:
            text = "Not cuddly 😾"
        case 2:
            text = "likes pets sometimes 😿"
        case 3:
            text = "If they feel like it 😼"
        case 4:
            text = "Above average 😺"
        case 5:
            text = "Extremely! 😸"
        default:
            text = ""
        }
        affection.text = text
    
    }
    func grooming(cat: Int){
        
        var text = ""
        switch cat {
        case 1:
            text = "Low maintenence"
        case 2:
            text = "Maybe a little"
        case 3:
            text = "Semi often"
        case 4:
            text = "Grooming necessary"
        case 5:
            text = "Extremely necessary"
        default:
            text = ""
        }
        grooming.text = text
        
    }
    func health(cat: Int){
        var text = ""
        switch cat {
        case 1:
            text = "No health issues"
        case 2:
            text = "A few"
        case 3:
            text = "50/50"
        case 4:
            text = "Higher risk"
        case 5:
            text = "Extremely prone to health issuess"
        default:
            text = ""
        }
        health.text = text
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

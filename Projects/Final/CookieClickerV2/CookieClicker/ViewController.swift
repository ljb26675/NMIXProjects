//
//  ViewController.swift
//  CookieClicker
//
//  Created by Linsey Briley on 4/30/19.
//  Copyright © 2019 AppCoda. All rights reserved.
//

import UIKit

extension UIImageView {
    public func imageFromURL(urlString: String) {
        
        let activityIndicator = UIActivityIndicatorView(style: .gray)
        activityIndicator.frame = CGRect.init(x: 0, y: 0, width: self.frame.size.width, height: self.frame.size.height)
        activityIndicator.startAnimating()
        if self.image == nil{
            self.addSubview(activityIndicator)
        }
        
        URLSession.shared.dataTask(with: NSURL(string: urlString)! as URL, completionHandler: { (data, response, error) -> Void in
            
            if error != nil {
                print(error ?? "No Error")
                return
            }
            DispatchQueue.main.async(execute: { () -> Void in
                let image = UIImage(data: data!)
                activityIndicator.removeFromSuperview()
                self.image = image
            })
            
        }).resume()
    }
}

class ViewController: UIViewController {

    
    var timer = Timer()
    
    var dataValues: NSArray = []
    var names = ["sugar", "oatmeal", "thumbprint", "thinmint", "shortbread", "peanut", "samoa", "macadamia", "m&m", "icing", "oreo", "choc" ]
    
    var index = 0
    
    
    //var cookies: [String] = []
    
    
    @IBOutlet var cookieButton: UIButton!
    
    var up = 1
    var auto = 1
    var autoTime = 3.0
    
    @IBOutlet var autoTimer: UILabel!
    @IBOutlet var autoClick: UILabel!
    @IBOutlet var userClick: UILabel!
    
    var costAutoTimer = 1024
    var costAutoClick = 512
    var costUserClick = 256
    
    @IBOutlet var statText: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scheduledTimerWithTimeInterval()
        loadData()
        // Do any additional setup after loading the view.
    }
    var numClicks = 0
    @IBOutlet var text: UILabel!
    
    @IBAction func click() {
        numClicks+=up
        text.text = String(numClicks) + " clicks!"
    }
    
    func autoc(){
        numClicks+=auto
        text.text = String(numClicks) + " clicks!"
    }
    
    func scheduledTimerWithTimeInterval(){
        // Scheduling timer to Call the function "updateCounting" with the interval of 1 seconds
        timer = Timer.scheduledTimer(timeInterval: autoTime, target: self, selector: #selector(self.updateCounting), userInfo: nil, repeats: true)
    }
    
    @objc func updateCounting(){
        autoc()
    }
    
    //upgrade timer -> autoTimer --
    @IBAction func upgradeTimer() {
        //up*=2
        //print(up)
        
        if(numClicks >= costAutoTimer && autoTime > 0.25){
            numClicks-=costAutoTimer
            costAutoTimer*=2
            autoTime-=0.25
            scheduledTimerWithTimeInterval()
            updateLabels()
        }
    }
    
    //upgrade auto clicks -> auto*=2
    @IBAction func upgradeAuto(_ sender: Any) {
        if(numClicks >= costAutoClick){
            numClicks-=costAutoClick
            costAutoClick*=2
            auto*=2
            updateLabels()
        }
    }
    @IBAction func upgradeClicks() {
        
        if(numClicks >= costUserClick){
            numClicks-=costUserClick
            costUserClick*=2
            up*=2
            updateCookie()
            updateLabels()
        }
        
    }
    
    func updateCookie(){
        
        if(index+1 < names.count){
            index+=1
        } else{
            index = 0
        }
        
        
        cookieButton.setImage(UIImage(named: names[index]), for: UIControl.State.normal)
    }
    
    func updateLabels(){
        text.text = String(numClicks) + " clicks!"
        autoTimer.text = String(costAutoTimer)
        autoClick.text = String(costAutoClick)
        userClick.text = String(costUserClick)
        statText.text = "stats: clicks - " + String(up) + " | autoClicks - " + String(auto) + " | autoTimer - " + String(autoTime) + "s "
        
        
    }
    
    func loadData(){
       /* let dataUrl = NSURL(string: "http://shibe.online/api/shibes?count=100&urls=true&httpsUrls=true")
        
        let theData = NSData(contentsOf: dataUrl! as URL)
        dataValues = try! JSONSerialization.jsonObject(with: theData! as Data, options: JSONSerialization.ReadingOptions.mutableContainers) as! NSArray
        print(dataValues.count);
        
        for i in 0..<dataValues.count {
        
            let dataLine = dataValues[i]
            print(dataLine);
            //names[i] = (((dataLine as AnyObject)["name"] as? String)!)
            names.insert((dataLine as! String), at: i)
        
        
        }
        
        
        let image: UIImageView
        image = UIImageView(frame:CGRect(x: 0, y: 0, width: 100, height: 200))
        image.imageFromURL(urlString: names[0])
        //cookieButton.imageView?.imageFromURL(urlString: names[0])
    print(image)*/
        
        
    //cookieButton.setImage(UIImage(named: "choc"), for: UIControl.State.normal)
    }
}


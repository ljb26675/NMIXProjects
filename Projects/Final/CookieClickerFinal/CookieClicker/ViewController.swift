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

extension Double {
    /// Rounds the double to decimal places value
    func rounded(toPlaces places: Double) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
}

class ViewController: UIViewController {

    
    var timer = Timer()
    
    @IBOutlet var mainView: UIView!
    
    var dataValues: NSArray = []
    var names = ["sugar", "oatmeal", "thumbprint", "thinmint", "shortbread", "peanut", "samoa", "macadamia", "m&m", "icing", "oreo", "choc" ]
    
    var index = 0
    
    var stats = 0.0
    
    
    //var cookies: [String] = []
    
    
    @IBOutlet var cookieButton: UIButton!
    
    var up = 1.0
    var auto = 1.0
    var autoTime = 11.0
    
    @IBOutlet var autoTimer: UILabel!
    @IBOutlet var autoClick: UILabel!
    @IBOutlet var userClick: UILabel!
    @IBOutlet var cookieSec: UILabel!
    
    var costAutoTimer = 10
    var costAutoClick = 5
    var costUserClick = 1
    
    @IBOutlet var statText: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scheduledTimerWithTimeInterval()
        loadData()
        setGradient()
        // Do any additional setup after loading the view.
    }
    //var numClicks = 0
    var numClicks = 0.0
    @IBOutlet var text: UILabel!
    
    @IBAction func click() {
        numClicks+=up
        text.text = String(Int(numClicks)) + " cookies!"
    }
    
    func autoc(){
        //numClicks+=auto
        numClicks+=stats
        text.text = String(Int(numClicks)) + " cookies!"
    }
    
    func scheduledTimerWithTimeInterval(){
        // Scheduling timer to Call the function "updateCounting" with the interval of 1 seconds
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(self.updateCounting), userInfo: nil, repeats: true)
    }
    
    @objc func updateCounting(){
        autoc()
    }
    
    //upgrade timer -> autoTimer --
    @IBAction func upgradeTimer() {
        //up*=2
        //print(up)
        
        if(Int(numClicks) >= costAutoTimer && autoTime > 0.25){
            numClicks-=Double(costAutoTimer)
            costAutoTimer*=5
            autoTime-=1.0
            stats = Double(auto)/autoTime
            //scheduledTimerWithTimeInterval()
            updateLabels()
        }
    }
    
    //upgrade auto clicks -> auto*=2
    @IBAction func upgradeAuto(_ sender: Any) {
        if(Int(numClicks) >= costAutoClick){
            numClicks-=Double(costAutoClick)
            costAutoClick*=4
            auto*=2
            stats = Double(auto)/autoTime
            updateLabels()
        }
    }
    @IBAction func upgradeClicks() {
        
        if(Int(numClicks) >= costUserClick){
            numClicks-=Double(costUserClick)
            costUserClick*=3
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
        text.text = String(Int(numClicks)) + " cookies!"
        cookieSec.text = String(stats.rounded(toPlaces: 2.0)) + " cookies/sec"
        autoTimer.text = String(costAutoTimer)
        autoClick.text = String(costAutoClick)
        userClick.text = String(costUserClick)
        statText.text = "stats: clicks - " + String(up) + " | autoClicks - " + String(auto) + " | autoTimer - " + String(autoTime) + "s "
        
        
    }
    
    func setGradient() {
        let gradient: CAGradientLayer = CAGradientLayer()
        gradient.colors = [UIColor.cyan.cgColor, UIColor.purple.cgColor]
        gradient.locations = [0.0 , 1.0]
        gradient.startPoint = CGPoint(x: 0.0, y: 0.0)
        gradient.endPoint = CGPoint(x: 1.0, y: 1.0)
        gradient.frame = mainView.layer.frame
        mainView.layer.insertSublayer(gradient, at: 0)
        
        
        /*let background = UIImage(named: "bg")
        
        var imageView : UIImageView!
        imageView = UIImageView(frame: view.bounds)
        imageView.contentMode =  UIView.ContentMode.scaleToFill
        imageView.clipsToBounds = true
        imageView.image = background
        imageView.center = view.center
        view.addSubview(imageView)
        self.view.sendSubviewToBack(imageView)*/
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


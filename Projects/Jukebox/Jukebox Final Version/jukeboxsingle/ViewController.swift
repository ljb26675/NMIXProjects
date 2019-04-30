//
//  ViewController.swift
//  jukeboxsingle
//
//  Created by Linsey Briley on 4/25/19.
//  Copyright © 2019 AppCoda. All rights reserved.
//

import UIKit

// note that AVFoundation  is imported below
import AVFoundation

extension String {
    func replace(string:String, replacement:String) -> String {
        return self.replacingOccurrences(of: string, with: replacement, options: NSString.CompareOptions.literal, range: nil)
    }
    
    func removeWhitespace() -> String {
        return self.replace(string: " ", replacement: "")
    }
    func makeURLSearch() -> String {
        return self.replace(string: " ", replacement: "+")
    }
}

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

class ViewController: UIViewController, AVAudioPlayerDelegate, UISearchBarDelegate {
    
    // jukebox variable tied to AVAudioPlayer
    var jukeBox: AVPlayer?
    var search = "pop"
    var currInd = 0
    
    var searchResults = [String]()
    var covers = [String]()
    var songNames = [String]()
    var artistNames = [String]()
    var songs = [String]()

    @IBOutlet var mainView: UIView!
    @IBOutlet var songNLabel: UILabel!
    @IBOutlet var artist: UILabel!
    
    
    @IBOutlet var searchBar: UISearchBar!
    
    @IBOutlet var go: UIButton!
    @IBOutlet var previous: UIButton!
    @IBOutlet var nextb: UIButton!
    @IBOutlet var volumeSlider: UISlider!
    @IBOutlet var playB: UIButton!
    
    @IBOutlet var imageView: UIImageView!
    
    @IBAction func adjustVolume(_ sender: Any) {
        if jukeBox != nil {
            jukeBox?.volume = volumeSlider.value
        }
    }
    @IBAction func enter() {
        
        print(searchBar.text as! String)
        search = searchBar.text as! String
        
        loadData()
    }
    
    
    @IBAction func next() {
        if(currInd < covers.count-1){
            currInd+=1
            imageView.imageFromURL(urlString: covers[currInd])
            songNLabel.text? = songNames[currInd]
            artist.text? = artistNames[currInd]
            playMe(theSong: songs[currInd])
        }
    }
    
    
    @IBAction func prev() {
        if(currInd > 0){
            currInd-=1
            imageView.imageFromURL(urlString: covers[currInd])
            songNLabel.text? = songNames[currInd]
            artist.text? = artistNames[currInd]
            playMe(theSong: songs[currInd])
            
        }
    }
    @IBAction func play() {
        print(playB.titleLabel?.text )
        if playB.titleLabel?.text as! String == "Pause"{
            if let player = jukeBox {
                player.pause()
            }
            playB.setTitle("Play", for: .normal)
        } else{
            if let player = jukeBox {
                player.play()
            }
            playB.setTitle("Pause", for: .normal)

        }
        
    }
    
    func playMe(theSong: String) {
        // the 'let url' line below sets the path; theSong is the name of the audio file minus the suffix.
        //This line will trigger an error if you misspell the name of an audio file!
        /*let url = URL.init(fileURLWithPath: Bundle.main.path(forResource: theSong, ofType: "mp3")!)*/
        // the "do" instructions set everything up to play
        let url = URL(string: theSong)
        let playerItem:AVPlayerItem = AVPlayerItem(url: url!)
        //player = AVPlayer(playerItem: playerItem)
        do {
            try jukeBox = AVPlayer(playerItem: playerItem)
            //jukeBox?.delegate = self
            //jukeBox?.prepareToPlay()
        } catch let error as NSError {
            print("audioPlayer error \(error.localizedDescription)")
        }
        
        // this line tells the jukebox to play!
        if let player = jukeBox {
            player.play()
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchBar.layer.cornerRadius = 4
        go.layer.cornerRadius = 4
        previous.layer.cornerRadius = 4
        nextb.layer.cornerRadius = 4
        playB.layer.cornerRadius = 4
        setGradient()
        loadData()
        
        // Do any additional setup after loading the view.
    }
    
    func loadData(){
        
        
        covers = [String]()
        songNames = [String]()
        artistNames = [String]()
        songs = [String]()
        //let s = search.removeWhitespace()
        let s = search.makeURLSearch()
        let searchTerm = "https://itunes.apple.com/search?term=" +  s  + "&amp;limit=525&amp;entity=song"
        let dataUrl = NSURL(string: searchTerm)
        
        let theData = NSData(contentsOf: dataUrl! as URL)
        let dataValues = try! JSONSerialization.jsonObject(with: theData! as Data, options: JSONSerialization.ReadingOptions.mutableContainers) as! NSDictionary
        if let resultsArray = dataValues["results"] as? NSArray {
            for i in 0..<resultsArray.count {
                if let dict = resultsArray[i] as? NSDictionary {
                    //dict["address"] should have your address
                    
                    var myUrl = ""
                    var mySongTitle = ""
                    var artistName = ""
                    var song = ""
                    var replaced = ""
                    
                    if dict["artworkUrl100"] as? String != nil && dict["trackName"] as? String != nil && dict["artistName"] as? String != nil && dict["previewUrl"] as? String != nil{
                        myUrl = dict["artworkUrl100"] as! String
                        mySongTitle = dict["trackName"] as! String
                        artistName = dict["artistName"] as! String
                        song = (dict["previewUrl"] as! String)
                        
                        replaced = (myUrl as AnyObject).replacingOccurrences(of: "100", with: "500")
                    }else{
                        //insert placeholder song here
                        myUrl = "https://is5-ssl.mzstatic.com/image/thumb/Music111/v4/81/fd/5f/81fd5fae-eb96-95b3-445c-373a8c5fc59d/source/100x100bb.jpg"
                        mySongTitle = "We Are Number One"
                        artistName = "4Fate"
                        song = "https://audio-ssl.itunes.apple.com/apple-assets-us-std-000001/AudioPreview122/v4/58/ec/0a/58ec0aff-ad77-f5a3-ae7a-9a8d3407c010/mzaf_4533620761724566376.plus.aac.p.m4a"
                        
                        replaced = (myUrl as AnyObject).replacingOccurrences(of: "100", with: "500")
                    
                        
                        
                    }
                    
                    covers.insert(replaced, at:i)
                    songNames.insert(mySongTitle, at:i)
                    artistNames.insert(artistName, at:i)
                    songs.insert(song, at:i)
                    
                }
            }
        }
        
        let resultsArray = dataValues["results"] as? NSArray
        if(resultsArray!.count != 0){
            imageView.imageFromURL(urlString: covers[0])
            songNLabel.text? = songNames[0]
            artist.text? = artistNames[0]
            playMe(theSong: songs[0])
        }else{
            songNLabel.text? = "No songs found. Please research."
        }
    }
    
    func setGradient() {
        let gradient: CAGradientLayer = CAGradientLayer()
        gradient.colors = [UIColor.magenta.cgColor, UIColor.orange.cgColor]
        gradient.locations = [0.0 , 1.0]
        gradient.startPoint = CGPoint(x: 0.0, y: 0.0)
        gradient.endPoint = CGPoint(x: 1.0, y: 1.0)
        gradient.frame = mainView.layer.frame
        mainView.layer.insertSublayer(gradient, at: 0)
    }


}


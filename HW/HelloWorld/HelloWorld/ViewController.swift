//
//  ViewController.swift
//  HelloWorld
//
//  Created by Linsey Briley on 1/17/19.
//  Copyright © 2019 Linsey Briley. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    @IBAction func showMessage(sender: UIButton){
        
        //initializa dictionary for emoji icons
        var emojiDict: [String: String] = ["👻": "Ghost",
                                           "👾": "Alien Monster",
                                           "🤓": "Nerd",
                                           "🤖": "Robot"]
        
        
        
        //the sender is the button tapped by the user
        let selectedButton = sender
        
        //get emoji from title label of the selected button
        if let wordToLookup = selectedButton.titleLabel?.text{
            
            let meaning = emojiDict[wordToLookup]
            
        
            let alertController = UIAlertController(title: "Meaning",
                                                    message: meaning, preferredStyle: UIAlertController.Style.alert)
            alertController.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            present(alertController, animated: true, completion: nil)
            
        }
    
    }
}


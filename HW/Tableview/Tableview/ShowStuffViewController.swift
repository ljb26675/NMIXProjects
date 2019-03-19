//
//  ShowStuffViewController.swift
//  Tableview
//
//  Created by Linsey Briley on 3/19/19.
//  Copyright © 2019 AppCoda. All rights reserved.
//

import UIKit

class ShowStuffViewController: UIViewController {
    
    var myText = ""
    @IBOutlet var showText: UITextView!
    
    var myLabel = ""
    @IBOutlet var showLabel: UILabel!
    
    var myImage = ""
    
    @IBOutlet var theImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showText.text = myText
        showLabel.text = myLabel
        theImage.image = UIImage(named: myImage)

        

        // Do any additional setup after loading the view.
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

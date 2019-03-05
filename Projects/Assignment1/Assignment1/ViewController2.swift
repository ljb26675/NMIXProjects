//
//  ViewController2.swift
//  Assignment1
//
//  Created by Linsey Briley on 2/7/19.
//  Copyright © 2019 AppCoda. All rights reserved.
//

import UIKit

class ViewController2: UIViewController {
    
    
    //have the arrays to display in the second view controller, will pass
    //1 or 2 to show which array to display
    /*var array1 = ["bluebird.jpg", "fortbenning.jpg", "girlscouts.jpg"]
    var array2 = ["helen.jpg", "otis.jpg", "beach.jpg"]
    */
    
    
    var array = [ ["hugs.jpg", "big eyes.jpg", "meow.jpg", "run.jpg", "sad.jpg"],
                  ["happy.jpg", "tired.jpg", "mad.jpg", "smart.jpg", "small.jpg"]
    ]
    var passedNum = String()
    
    var currentPicture=0
    
    var i = 0
    
    @IBOutlet var passedLabel: UILabel!
    //need to also add label that will change
    
    @IBOutlet var show: UIImageView!
    
    func showPico(){
        i = Int(passedNum) ?? 0
        let displayPic = UIImage(named: array[i][currentPicture])
        show.image = displayPic
        passedLabel.text = String(array[i][currentPicture].split(separator: ".").first!) //removes .jpg from picture name to describe the picture
    }

    @IBAction func previous() {
        if currentPicture == 0 {
            currentPicture = array[i].count-1
        }else{
            currentPicture-=1
        }
        showPico()
    }
    @IBAction func next() {
        if currentPicture == array[i].count-1 {
            currentPicture = 0
        } else{
            currentPicture+=1
        }
        showPico()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        showPico()
        //passedLabel.text = String(currentPicture)

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

//
//  displayPix.swift
//  PictureSegue
//
//  Created by Linsey Briley on 1/31/19.
//  Copyright © 2019 Linsey Briley. All rights reserved.
//

import UIKit

class displayPix: UIViewController {
    
    var picChosen = String()

    @IBOutlet var showImage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        showImage.image = UIImage(named: picChosen)

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


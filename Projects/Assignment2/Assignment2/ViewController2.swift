//
//  ViewController2.swift
//  Assignment2
//
//  Created by Linsey Briley on 2/26/19.
//  Copyright © 2019 AppCoda. All rights reserved.
//

import UIKit
import WebKit

class ViewController2: UIViewController {

    
    var passedNum = 0;
    var locations = ["https://goo.gl/maps/Sp97UbiadL32", "https://goo.gl/maps/Rrsyx27XhdE2", "https://goo.gl/maps/hpL6S23n1CN2", "https://goo.gl/maps/ETszd35aA9E2", "https://goo.gl/maps/1WWTktKC9UN2"]
    @IBOutlet var googleMap: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let url = URL (string: locations[passedNum])
        let request = URLRequest(url: url!)
        googleMap.load(request)
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

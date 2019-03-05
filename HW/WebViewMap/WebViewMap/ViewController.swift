//
//  ViewController.swift
//  WebViewMap
//
//  Created by Linsey Briley on 2/26/19.
//  Copyright © 2019 AppCoda. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController {

    
    
    @IBOutlet var googleMap: WKWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let url = URL (string: "https://bit.ly/247vGVc")
        let request = URLRequest(url: url!)
        googleMap.load(request)
        // Do any additional setup after loading the view, typically from a nib.
    }
    
}


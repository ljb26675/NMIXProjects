//
//  ViewController.swift
//  Jukebox
//
//  Created by Linsey Briley on 4/16/19.
//  Copyright © 2019 AppCoda. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setGradient()
        goButton.layer.cornerRadius = 4
        
        searchBar.layer.cornerRadius = 4
        let textFieldInsideSearchBar = searchBar.value(forKey: "searchField") as? UITextField
        
        textFieldInsideSearchBar?.textColor = UIColor.white
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = .clear //self.navigationController?.navigationBar.isTranslucent = true
        //self.navigationController!.navigationBar.tintColor = #colorLiteral(red: 1, green: 0.99997437, blue: 0.9999912977, alpha: 1)
        // Do any additional setup after loading the view.
    }
    
    @IBOutlet var searchBar: UISearchBar!
    @IBOutlet var goButton: UIButton!
    @IBOutlet weak var mainView: UIView!
    func setGradient() {
        let gradient: CAGradientLayer = CAGradientLayer()
        gradient.colors = [UIColor.magenta.cgColor, UIColor.orange.cgColor]
        gradient.locations = [0.0 , 1.0]
        gradient.startPoint = CGPoint(x: 0.0, y: 0.0)
        gradient.endPoint = CGPoint(x: 1.0, y: 1.0)
        gradient.frame = mainView.layer.frame
        mainView.layer.insertSublayer(gradient, at: 0)
    }
    
    func formatButton(){
        
        
        
    }
    
    
    
    


}


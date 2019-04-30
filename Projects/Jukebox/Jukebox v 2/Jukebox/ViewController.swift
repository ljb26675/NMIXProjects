//
//  ViewController.swift
//  Jukebox
//
//  Created by Linsey Briley on 4/16/19.
//  Copyright © 2019 AppCoda. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UISearchBarDelegate{
    
    @IBOutlet var searchBar: UISearchBar!
    @IBOutlet weak var mainView: UIView!
    
    @IBAction func tapRecognizer(_ sender: Any) {
        self.searchBar.resignFirstResponder()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setGradient()
        
        searchBar.delegate = self
        
        searchBar.layer.cornerRadius = 4
        let textFieldInsideSearchBar = searchBar.value(forKey: "searchField") as? UITextField
        
        textFieldInsideSearchBar?.textColor = UIColor.white
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = .clear
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
    
    func formatButton(){
        
        
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        searchBar.resignFirstResponder()
        if let text = searchBar.text {
            // here is text from the search bar
            print(text)
            
            let searchResultController: TableViewController = TableViewController()
            searchResultController.search = text
            navigationController?.pushViewController(searchResultController, animated: true)
        }
    }
    
    
    
    


}


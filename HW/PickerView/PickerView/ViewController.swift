//
//  ViewController.swift
//  PickerView
//
//  Created by Linsey Briley on 2/19/19.
//  Copyright © 2019 AppCoda. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    var cityData = [["Waycross", "Plains", "Athens", "Milledgeville", "Wrightsville"], ["Helen","Columbus","Macon","Fort Valley","Savannah"]]
                    
    var cityHighlights = [["Alligators", "Peanuts", "Heaven on earth", "Mental Hospital", "Home of Herschel"],
        ["Fake Bavaria","Fort Benning","Otis Redding","Bluebird School Bus","Girl Scouts"]]
    var cityPix = [["alligator.jpg","peanut.jpg","athens-georgia.jpg","milledgeville.jpg","herschel.jpg"],["helen.jpg","fortbenning.jpg","otis.jpg","bluebird.jpg","girlscouts.jpg"]]
    
    @IBOutlet var cityPicker: UIPickerView!
    
    @IBOutlet var cityImages: UIImageView!
    @IBOutlet var dataFromPicker: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.cityPicker.dataSource = self
        self.cityPicker.delegate = self
        // Do any additional setup after loading the view, typically from a nib.
    }

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        //return cityData.count
        return cityData[0].count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        //return cityData[row]
        return cityData[component][row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        /*dataFromPicker.text = cityHighlights[row]
        let cityPic = UIImage(named: cityPix[row])
         cityImages.image = cityPic*/
        dataFromPicker.text = cityHighlights[component][row]
        let cityPic = UIImage(named: cityPix[component][row])
        cityImages.image = cityPic
        /*return cityData[component][row]*/
    }

}


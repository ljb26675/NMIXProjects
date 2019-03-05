//
//  ViewController.swift
//  Assignment2
//
//  Created by Linsey Briley on 2/26/19.
//  Copyright © 2019 AppCoda. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource  {
    
    var cityData = ["New York", "London", "Sydney", "Tokyo", "Shanghai"]
    var mySelection = 0

    @IBOutlet var cityPicker: UIPickerView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.cityPicker.dataSource = self
        self.cityPicker.delegate = self
        // Do any additional setup after loading the view, typically from a nib.
    }
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        //return cityData.count
        return cityData.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        //return cityData[row]
        return cityData[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int){
        mySelection = row
    }
    
    //segue function to pass the values
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let  receiverView = segue.destination as! ViewController2
        //receiverView.passedNum = num
        receiverView.passedNum = mySelection
    }

}


//
//  ViewController.swift
//  BasicMap2
//
//  Created by Linsey Briley on 3/5/19.
//  Copyright © 2019 AppCoda. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController {

    @IBOutlet var myMap: MKMapView!
    @IBAction func mapType(_ sender: Any) {
        switch((sender as AnyObject).selectedSegmentIndex){
        case 0: myMap.mapType = .standard
        case 1: myMap.mapType = .satellite
        case 2: myMap.mapType = .hybrid
        default: myMap.mapType = .hybrid
            
        }

    }
    
    var myLatitude = 33.952435
    var myLongitude = -83.373957
    override func viewDidLoad() {
        super.viewDidLoad()
        //myMap.mapType = MKMapType.satellite
        let initialLocation = CLLocation(latitude: myLatitude, longitude: myLongitude)
        let regionRadius: CLLocationDistance = 1000
        func centerMapOnLocation(location: CLLocation){
            let coordinateRegion = MKCoordinateRegion(center: location.coordinate, latitudinalMeters:  regionRadius, longitudinalMeters: regionRadius)
            myMap.setRegion(coordinateRegion, animated: true)
            myMap.mapType = MKMapType.standard
            //myMap.mapType = MKMapType.standard
        }
        centerMapOnLocation(location: initialLocation)
        // Do any additional setup after loading the view, typically from a nib.
    }


}


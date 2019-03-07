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
    
    var myTitles = ["Geography Department", "Football Stadium", "Legion Pool", "Main Library"]
    var mySubtitles = ["Has a huge globe", "Will this be a happy place in 2017?", "Always closes too early", "Houses millions of paper books"]
    var latLong = [[33.948841,-83.375317 ],[33.949742,-83.373266 ],[33.949656,-83.378571 ],[33.954103,-83.373931 ]]
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
        /*let pinLatitude = 33.946039
        let pinLongitude = -83.374670
        
        var pinCoordinates: CLLocationCoordinate2D = CLLocationCoordinate2D()
        pinCoordinates.latitude = CDouble(pinLatitude)
        pinCoordinates.longitude = CDouble(pinLongitude)
        let pin: MKPointAnnotation = MKPointAnnotation()
        pin.coordinate = pinCoordinates
        self.myMap.addAnnotation(pin)
        pin.title = "this is the pin title"
        pin.subtitle = "this is a pin subtitle"*/
        
        var howMany = latLong.count
        var  latLongCounter = 0
        while(latLongCounter < howMany){
            
            let pinLatitude = latLong[latLongCounter][0]
            let pinLongitude = latLong[latLongCounter][1]
            
            var pinCoordinates: CLLocationCoordinate2D = CLLocationCoordinate2D()
            pinCoordinates.latitude = CDouble(pinLatitude)
            pinCoordinates.longitude = CDouble(pinLongitude)
            let pin: MKPointAnnotation = MKPointAnnotation()
            pin.coordinate = pinCoordinates
            self.myMap.addAnnotation(pin)
            pin.title = myTitles[latLongCounter]
            pin.subtitle = mySubtitles[latLongCounter]
            
            latLongCounter+=1
            
        }
        // Do any additional setup after loading the view, typically from a nib.
    }


}


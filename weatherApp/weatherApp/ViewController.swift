//
//  ViewController.swift
//  weatherApp
//
//  Created by Polina on 2/20/18.
//  Copyright © 2018 Polina. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController : UIViewController  {
    
    var locationManager: CLLocationManager = CLLocationManager()
    var startLocation: CLLocation!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        locationManager.requestWhenInUseAuthorization()
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.delegate = self
        print("del")
        locationManager.startUpdatingLocation()
        print("startupdate")
        startLocation = nil
        print("nil")
    }
}

extension ViewController: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager,
                         didUpdateLocations locations: [CLLocation])
    {
        let latestLocation: CLLocation = locations.last!
        
        print(String(format: "%.4f", latestLocation.coordinate.latitude))
        print(String(format: "%.4f", latestLocation.coordinate.longitude))
        
        if startLocation == nil {
            startLocation = latestLocation
        }
    }
    
    func locationManager(_ manager: CLLocationManager,
                         didFailWithError error: Error) {
        print("can't get current location")
    }
    
}

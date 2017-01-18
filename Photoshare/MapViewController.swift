//
//  MapViewController.swift
//  Photoshare
//
//  Created by André da Silva on 17/01/17.
//  Copyright © 2017 Photoshare_Team. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class MapViewController: UIViewController, CLLocationManagerDelegate {

    @IBAction func showPhotosBt(_ sender: Any) {
        self.performSegue(withIdentifier: "showPhotosViewSegue", sender: self)
        // debugger console
        print("::[DEBUGGER]:: HIT REGISTER BUTTON")
    }
    
    @IBAction func unwindToMapViewSegue(segue: UIStoryboardSegue) {
    }
    
    @IBOutlet weak var map: MKMapView!
    
    let manager = CLLocationManager()
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location = locations[0]
        
        let span:MKCoordinateSpan = MKCoordinateSpanMake(0.01, 0.01)
        
        let myLocation:CLLocationCoordinate2D = CLLocationCoordinate2DMake(location.coordinate.latitude, location.coordinate.longitude)

        let region:MKCoordinateRegion = MKCoordinateRegion(center: myLocation, span: span)
    
        map.setRegion(region, animated: true)
        
        self.map.showsUserLocation = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    
    }
    
}

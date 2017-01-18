//
//  PhotosViewController.swift
//  Photoshare
//
//  Created by André da Silva on 17/01/17.
//  Copyright © 2017 Photoshare_Team. All rights reserved.
//

import UIKit
import CoreLocation
import FirebaseDatabase
import FirebaseStorage
import CoreLocation

class PhotosViewController: UIViewController, CLLocationManagerDelegate {

    @IBOutlet var currentPhoto: UIImageView!
    
    @IBOutlet var userLabel: UILabel!
    @IBOutlet var noPhotoLabel: UILabel!
    
    let dbRef = FIRDatabase.database().reference()
    let storRef = FIRStorage.storage().reference().child("photos/")
    
    var currentPos = 0
    var tmpImgArray:[String] = []
    var tmpUsrArray:[String] = []
    let manager = CLLocationManager()
    var currentLocation:CLLocation!
    var tmpLoc:CLLocation!
    
    @IBOutlet var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fillImgArray()

        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()
        
    }
    
    func fillImgArray() {
        // limpar array
        self.tmpImgArray = []
        
        self.dbRef.child("Photos").observeSingleEvent(of: .value, with: { snapshot in
            for rest in snapshot.children.allObjects as! [FIRDataSnapshot] {

                // obter dados de cada foto
                let usr = rest.childSnapshot(forPath: "user")
                let lat = rest.childSnapshot(forPath: "latitude")
                let long = rest.childSnapshot(forPath: "longitude")
                
                self.tmpLoc = CLLocation(latitude: lat.value.unsafelyUnwrapped as! CLLocationDegrees, longitude: long.value.unsafelyUnwrapped as! CLLocationDegrees)
                
                if self.currentLocation.distance(from: self.tmpLoc) < 300 {
                    self.tmpImgArray.append(rest.key)
                    self.tmpUsrArray.append(usr.value.unsafelyUnwrapped as! String)
                    print(rest.key)
                    print(self.tmpImgArray.count)
                }
            }
        })
    }
    
    func setImage() {
        // after selecting images, choose one randomly and apply to imageVIEW
        
        if tmpImgArray.count == 0 {
            userLabel.isHidden = true
            noPhotoLabel.isHidden = false
            currentPhoto.isHidden = true
        } else {
            userLabel.isHidden = false
            noPhotoLabel.isHidden = true
            currentPhoto.isHidden = false
            if currentPos >= tmpImgArray.count {
                currentPos = 0
            }
            userLabel.text = tmpUsrArray[currentPos]
            let storIMG = self.storRef.child(tmpImgArray[currentPos]+".jpg")
            currentPos += 1
        
            storIMG.data(withMaxSize: 1 * 1920 * 1080) { data, error in
                if error != nil {
                    // Uh-oh, an error occurred!
                } else {
                    // Data for "images/island.jpg" is returned
                    self.imageView.image = UIImage(data: data!)
                }
            }
        }//else
        
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location = locations[0]
        self.currentLocation = location
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func nextPhoto(_ sender: Any) {
        setImage()
    }

}

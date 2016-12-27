//
//  OptionsViewController.swift
//  Photoshare
//
//  Created by André da Silva on 27/12/16.
//  Copyright © 2016 Photoshare_Team. All rights reserved.
//

import UIKit
import FirebaseAuth
import Firebase

class OptionsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func LogOutButton(_ sender: Any) {
        try! FIRAuth.auth()!.signOut()
        self.performSegue(withIdentifier: "LogOutSegue", sender: self)
    }
    
    @IBAction func ChangePWButton(_ sender: Any) {
        self.performSegue(withIdentifier: "ChangePWSegue", sender: self)
    }

    @IBAction func AboutButton(_ sender: Any) {
        let alert1 = UIAlertController(title: "About", message:
            "version 1.0 - Copyright CM 2016", preferredStyle: UIAlertControllerStyle.alert)
        alert1.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default,handler: nil))
        
        self.present(alert1, animated: true, completion: nil)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

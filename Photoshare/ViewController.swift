//
//  ViewController.swift
//  Photoshare
//
//  Created by André da Silva on 06/12/16.
//  Copyright © 2016 Photoshare_Team. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class ViewController: UIViewController {

    
    @IBOutlet var Email_field: UITextField!
    @IBOutlet var PW_field: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func LoginButton(_ sender: Any) {
        if Email_field.text! == "" || PW_field.text! == "" {
            let alertController = UIAlertController(title: "Login Failed!", message:
                "Please check you entered both E-Mail and Password.", preferredStyle: UIAlertControllerStyle.alert)
            alertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default,handler: nil))
            
            self.present(alertController, animated: true, completion: nil)
        }
        else {
            FIRAuth.auth()?.signIn(withEmail: Email_field.text!, password:  PW_field.text!, completion: {
                user, error in
            
                if error != nil {
                    print(error.debugDescription)
                } else {
                    print("::[DEBUGGER]:: LOGIN SUCCESSFUL!")
                }
            })
        }
    }
    @IBAction func CreateButton(_ sender: Any) {
        
    }

}


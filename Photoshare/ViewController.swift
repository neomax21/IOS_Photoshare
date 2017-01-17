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
        //Looks for single or multiple taps.
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(ViewController.dismissKeyboard))
        
        //Uncomment the line below if you want the tap not not interfere and cancel other interactions.
        //tap.cancelsTouchesInView = false
        
        view.addGestureRecognizer(tap)
    }
    
    //Calls this function when the tap is recognized.
    func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }

    @IBAction func unwindToLoginView(segue: UIStoryboardSegue) {
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func LoginButton(_ sender: Any) {
        if Email_field.text! == "" || PW_field.text! == "" {
            // if one or both fields are empty, shows a warning
            let alert1 = UIAlertController(title: "Login Failed!", message:
                "Please check you entered both E-Mail and Password.", preferredStyle: UIAlertControllerStyle.alert)
            alert1.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default,handler: nil))
            
            self.present(alert1, animated: true, completion: nil)
        }
        else {
            // tries to log in
            FIRAuth.auth()?.signIn(withEmail: Email_field.text!, password:  PW_field.text!, completion: {
                user, error in
            
                if error != nil {
                    let alert2 = UIAlertController(title: "Login Failed!", message:
                        "Email or Password incorrect!", preferredStyle: UIAlertControllerStyle.alert)
                    alert2.addAction(UIAlertAction(title: "Retry", style: UIAlertActionStyle.default,handler: nil))
                    
                    self.present(alert2, animated: true, completion: nil)
                    // debugger console
                    print("::[DEBUGGER]:: LOGIN FAILED!")
                    
                } else {
                    // if logged in shows next view
                    self.performSegue(withIdentifier: "LoggedIN", sender: self)
                    // debugger console
                    print("::[DEBUGGER]:: LOGIN SUCCESSFUL!")
                }
            })
        }
    }
    @IBAction func CreateButton(_ sender: Any) {
        // loads register view
        self.performSegue(withIdentifier: "RegisterSegue", sender: self)
        // debugger console
        print("::[DEBUGGER]:: HIT REGISTER BUTTON")
    }

}


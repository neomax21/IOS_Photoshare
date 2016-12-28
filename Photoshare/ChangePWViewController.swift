//
//  ChangePWViewController.swift
//  Photoshare
//
//  Created by André da Silva on 27/12/16.
//  Copyright © 2016 Photoshare_Team. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class ChangePWViewController: UIViewController {

    @IBOutlet var email: UITextField!
        
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func RequestPW(_ sender: Any) {
        if self.email.text == "" || self.email.text != FIRAuth.auth()?.currentUser?.email {
            let alertController = UIAlertController(title: "Error!", message: "Please enter your E-Mail!!", preferredStyle: .alert)
            
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alertController.addAction(defaultAction)
            
            self.present(alertController, animated: true, completion: nil)
        }
        else
        {
            FIRAuth.auth()?.sendPasswordReset(withEmail: self.email.text!, completion: { (error) in
                
                var title = ""
                var message = ""
                
                if error != nil
                {
                    title = "Oops!"
                    message = (error?.localizedDescription)!
                }
                else
                {
                    title = "Success!"
                    message = "Password reset email sent."
                    self.email.text = ""
                }
                
                let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
                
                let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                alertController.addAction(defaultAction)
                
                self.present(alertController, animated: true, completion: nil)
            })
        }
        
        
        /* old stuff
         if let user = FIRAuth.auth()?.currentUser {
         print("::[DEBUGGER]:: Authenticated check")
         //change to new password
         user.updatePassword(new_pw.text!, completion: { (error) in
         if let error = error {
         print("::[DEBUGGER]:: God knows why this failed")
         print(error.localizedDescription)
         } else {
         print("::[DEGUBBER]:: UPDATED successfully")
         
         let alert2 = UIAlertController(title: "Password Change", message:
         "You have successfully changed your Password", preferredStyle: UIAlertControllerStyle.alert)
         alert2.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default,handler: nil))
         
         self.present(alert2, animated: true, completion: nil)
         }
         })
         }*/
        // function end

    }


}

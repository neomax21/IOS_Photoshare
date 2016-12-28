//
//  RegisterViewController.swift
//  Photoshare
//
//  Created by André da Silva on 09/12/16.
//  Copyright © 2016 Photoshare_Team. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class RegisterViewController: UIViewController {

    @IBOutlet var Name_field: UITextField!
    @IBOutlet var PWcheck_field: UITextField!
    @IBOutlet var PW_field: UITextField!
    @IBOutlet var Email_field: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        //Looks for single or multiple taps.
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(RegisterViewController.dismissKeyboard))
        
        //Uncomment the line below if you want the tap not not interfere and cancel other interactions.
        //tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    //Calls this function when the tap is recognized.
    func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func RegisterButton(_ sender: Any) {
        let name = Name_field.text!
        let email = Email_field.text!
        let pw = PW_field.text!
        let pw_check = PWcheck_field.text!
        
        let isEqual = (pw == pw_check)
        if isEqual == true {
            FIRAuth.auth()?.createUser(withEmail: email, password: pw, completion: { (user: FIRUser?, error) in
                if error == nil {
                    print(name)
                    self.performSegue(withIdentifier: "AfterRegisterSegue", sender: self)
                }else{
                    let alert2 = UIAlertController(title: "Error in registering User", message:
                        "Please check if Internet connection is active or if you have already registered this e-mail", preferredStyle: UIAlertControllerStyle.alert)
                    alert2.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default,handler: nil))
                    
                    self.present(alert2, animated: true, completion: nil)
                }
                
            })
        }
        else {
            let alert = UIAlertController(title: "ERROR", message:
                "Passwords don't match", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default,handler: nil))
            
            self.present(alert, animated: true, completion: nil)
        }
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

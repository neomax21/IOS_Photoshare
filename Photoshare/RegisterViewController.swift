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
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func CancelButton(_ sender: Any) {
        self.performSegue(withIdentifier: "CancelSegue", sender: self)
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
                }
                
            })
        }
        else {
            
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

//
//  RegisterViewController.swift
//  Photoshare
//
//  Created by André da Silva on 09/12/16.
//  Copyright © 2016 Photoshare_Team. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {
    @IBOutlet var Name_field: UITextField!
    @IBOutlet var Emaill_field: UITextField!
    @IBOutlet var PW_field: UITextField!
    @IBOutlet var PWCheck_field: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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

//
//  AddItemViewController.swift
//  IIP
//
//  Created by Ayush Verma on 23/04/17.
//  Copyright © 2017 ayush. All rights reserved.
//

import UIKit
import Firebase

class AddItemViewController: UIViewController {

    @IBOutlet weak var descLabel: UITextField!
    @IBOutlet weak var titleLabel: UITextField!
    @IBOutlet weak var numberLabel: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func addItem(_ sender: Any) {
        
        if titleLabel.text == "" || descLabel.text == "" || numberLabel.text == "" {
            return
        }
        let x = ["title" : titleLabel.text!, "desc" : descLabel.text!, "verified": false, "phone" : numberLabel.text!] as [String : Any]
        FIRDatabase.database().reference().childByAutoId().setValue(x)
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

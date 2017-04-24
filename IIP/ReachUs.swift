//
//  ReachUs.swift
//  IIP
//
//  Created by Ayush Verma on 14/03/17.
//  Copyright © 2017 ayush. All rights reserved.
//

import UIKit
import MessageUI

class ReachUs: UIViewController,MFMailComposeViewControllerDelegate  {
	@IBOutlet weak var subjectTF: UITextField!

	@IBOutlet weak var messageTF: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
	func sendEmail() {
		let composeVC = MFMailComposeViewController()
		composeVC.mailComposeDelegate = self
		// Configure the fields of the interface.
		composeVC.setToRecipients(["mustafaaliasger.2014@vit.ac.in"])
		composeVC.setSubject("\(subjectTF.text!)")
		composeVC.setMessageBody("\(messageTF.text!)", isHTML: false)
		// Present the view controller modally.
		self.present(composeVC, animated: true, completion: nil)
	}
	
	func mailComposeController(_ controller: MFMailComposeViewController,
	                           didFinishWith result: MFMailComposeResult, error: Error?) {
		// Check the result or perform other tasks.
		// Dismiss the mail compose view controller.
		controller.dismiss(animated: true, completion: nil)
	}

	@IBAction func sendMail(_ sender: Any) {
		if subjectTF.text != "" && messageTF.text != "" {
			sendEmail()
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




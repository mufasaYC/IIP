//
//  ImportantContact.swift
//  IIP
//
//  Created by Ayush Verma on 14/03/17.
//  Copyright © 2017 ayush. All rights reserved.
//

import UIKit

class ImportantContact: UIViewController , UITableViewDelegate , UITableViewDataSource {

    @IBOutlet weak var contactList: UITableView!
    
    
    var list = ["Dean Office" , "Hostel Office Men's", "Hostel Office Girl's", "Papa John's" ,
                "Dominos" ,"cafe Cofee Day","Burger King","Pizza Hut","Vellore Kitchen","Barbeque Nation","Subway","SJT","T.T","CDMM","CBMR","M.B","GDN","SMVG", "etc"]
	var numbers = ["9833451538","9833451538","9833451538","9833451538","9833451538","9833451538","9833451538","9833451538","9833451538","9833451538","9833451538","9833451538","9833451538","9833451538","9833451538","9833451538","9833451538","9833451538","9833451538"]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
		contactList.delegate = self
		contactList.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "cell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        
		
		cell.textLabel?.text = list[indexPath.row]
		
        return cell
    }
	
	func numberOfSections(in tableView: UITableView) -> Int {
		return 1
	}
	
	
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		call(x :indexPath.row)
	}
	
	func call(x: Int) {
		if let phoneCallURL = URL(string: "tel://\(numbers[x]))") {
			let application:UIApplication = UIApplication.shared
			if (application.canOpenURL(phoneCallURL)) {
				if #available(iOS 10.0, *) {
					application.open(phoneCallURL, options: [:], completionHandler: nil)
				} else {
					UIApplication.shared.openURL(phoneCallURL)
				}
			}
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

//
//  ViewController.swift
//  IIP
//
//  Created by Ayush Verma on 14/03/17.
//  Copyright © 2017 ayush. All rights reserved.
//

import UIKit
import Firebase

class LostFound: UIViewController,UITableViewDelegate,UITableViewDataSource {
   
    @IBOutlet weak var tableView: UITableView!
    
    //var pName = ["Ayush","Ridha","Siddhart","Avani","Somitro","Rajvansh","Pritish","Bavya","Sanket"]
    //var mobile = ["1234567890","1234567890","1234567890","1234567890","1234567890","1234567890","1234567890","1234567890","1234567890"]
    
   // var product = ["IIP","IIP","IIP","IIP","IIP","IIP","IIP","IIP","IIP"]
    
    var lostItems = [NSDictionary]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tableView.delegate = self
        tableView.dataSource = self
        tableView.estimatedRowHeight = 100
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.reloadData()
        fetchData()
    }

    func fetchData() {
        print("HERE")
        FIRDatabase.database().reference().observe(.value, with: {snap in
            print(snap)
            self.lostItems.removeAll()
            let x = snap.children.allObjects as! [FIRDataSnapshot]
            for i in x {
                let j = i.value as! Dictionary<String, AnyObject>
                if j["verified"] as! Bool == true {
                    self.lostItems.append(j as NSDictionary)
                }
                if i == x.last {
                    self.tableView.reloadData()
                }
            }
        })
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return lostItems.count
        //return pName.count
     //   return mobile.count
     //   return product.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellidentifier = "cell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellidentifier, for: indexPath) as! CustomCell
        
        cell.titleLabel.text = "\(lostItems[indexPath.row]["title"]!)"
        cell.descLabel.text = "\(lostItems[indexPath.row]["desc"]!)"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            lostItems.remove(at: indexPath.row)
            tableView.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //CALL
        print("GELLO")
        call()
    
    }
    
    func call() {
        
        if let phoneCallURL = URL(string: "tel://9833451538)") {
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
    

}


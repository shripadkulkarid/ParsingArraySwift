//
//  ViewController.swift
//  ParsingArray
//
//  Created by Apple on 21/07/17.
//  Copyright © 2017 Apple. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var tableview: UITableView!
    
    
    
    var names:[String] = []
    var contacts:[String] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let url = URL(string: "http://api.androidhive.info/contacts/")
        
        do {
           let allContactsData = try Data(contentsOf: url!)
            
            let allcontacs = try JSONSerialization.jsonObject(with: allContactsData, options: .allowFragments) as! [String :AnyObject]
            
            if let arrJSON = allcontacs["contacts"]as? [[String : Any]]  {
                
                for index in 0...arrJSON.count-1 {
                   // let aObject = arrJSON[index] as!  [NSObject:AnyObject]
                    let aObject = arrJSON[index] as [String : AnyObject]
                   names.append(aObject["name"] as! String)
                    contacts.append(aObject["email"] as! String)
                    
                    
                    
                }
                
                
                
                
            }
            
            print(names)
            print(contacts)
            
            self.tableview.reloadData()
            
            
            
            
            
            
        } catch{}
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.names.count
    }
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        
        
        
        if !(cell == nil) {
            cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cell")
        }
        cell?.textLabel?.text = self.names[indexPath.row]
        cell?.detailTextLabel?.text = self.contacts[indexPath.row]
        //cell?.textLabel?.text = self.contacts[indexPath.row]
        
        
        return cell!
        
    }
    @objc func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("You selected name : "+names[indexPath.row])
    }
    
}


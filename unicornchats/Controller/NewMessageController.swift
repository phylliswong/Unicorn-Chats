//
//  NewMessageController.swift
//  unicornchats
//
//  Created by Phyllis Wong on 2/8/18.
//  Copyright © 2018 Phyllis Wong. All rights reserved.
//

import UIKit
import Firebase

class NewMessageController: UITableViewController {
    
    let cellId = "cellId"
    
    var users = [UNIUser]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // show cancel button left
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "cancel", style: .plain, target: self, action: #selector(handleCancel))
        
        fetchUser()
    }
    
    func fetchUser() {
        print("Users fetched from the db")
        Database.database().reference().child("users").observe(.childAdded, with: { (snapshot) in
            
            if let user = UNIUser(snapshot) {
                print(user.name ?? "no name", user.email ?? " no email")
            }
            
//            print("user found")
//            print(snapshot)
            
        }, withCancel: nil)
    }
    
    @objc func handleCancel() {
        dismiss(animated: true, completion: nil)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // FIXME: lets use a hack for now
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: cellId)
        
        cell.textLabel?.text = "Dummy text: LALALALA"
        
        return cell
        
    }

}

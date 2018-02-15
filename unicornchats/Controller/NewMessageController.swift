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
    var users = [Users]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // show cancel button left
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(handleCancel))
        tableView.register(UserCell.self, forCellReuseIdentifier: cellId)
        
        fetchUser()
    }
    
    func fetchUser() {
        print("Users fetched from the db")
        Database.database().reference().child("users").observe(.childAdded, with: { (DataSnapshot) in
            
//            if let user = UNIUser(snapshot) {
//                let userDict = [String: AnyObject]()
//
//                user.setValuesForKeys(userDict)
//                self.users.append(user)
//
//
//                // Bring the closure operation back to the main thread
//                DispatchQueue.main.async {
//                    self.tableView.reloadData()
//                }
//
//            }
            
            if let dictionary = DataSnapshot.value as? [String: AnyObject] {
                let user = Users()
                
                user.setValuesForKeys(dictionary)
                self.users.append(user)
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
                
                // safely unwrap the values
                guard let name = user.name, let email = user.email else {
                    return
                }
                print("User name: \(name), email: \(email)")
            }
            
        }, withCancel: nil)
    }
    
    @objc func handleCancel() {
        dismiss(animated: true, completion: nil)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // FIXME: lets use a hack for now
        // we need to dequeue our cells for memory efficiency
//        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: cellId)
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        
        let user = users[indexPath.row]
        cell.textLabel?.text = user.name
        cell.detailTextLabel?.text = user.email
        
        return cell
        
    }

}

class UserCell: UITableViewCell {
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}




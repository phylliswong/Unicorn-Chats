//
//  MessagesController.swift
//  unicornchats
//
//  Created by Phyllis Wong on 2/1/18.
//  Copyright © 2018 Phyllis Wong. All rights reserved.
//

import UIKit
import Firebase

class MessagesController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Add the logout button to the left side of the navigation bar
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "logout", style: .plain, target: self, action: #selector(handleLogout))
        
        // New message icon/button to the right of the bar
        let image = UIImage(named: "newMessage")
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: image, style: .plain, target: self, action: #selector(handleNewMessage))
        
        checkIfUserIsLoggedIn()
        
    }
    
    @objc func handleNewMessage() {
        
        let newMessageController = NewMessageController()
        let navController = UINavigationController(rootViewController: newMessageController)
        present(navController, animated: true, completion: nil)
        print("new message was pressed")
    }
    
    func checkIfUserIsLoggedIn() {
        // User is not logged in
        if Auth.auth().currentUser?.uid == nil {
            perform(#selector(handleLogout), with: nil, afterDelay: 0)
        } else {
            
            // Get the user's name data from the db
            let uid = Auth.auth().currentUser?.uid
            Database.database().reference().child("users").child(uid!).observeSingleEvent(of: .value, with: { (snapshot) in
                
                if let dictionary = snapshot.value as? [String: AnyObject] {
                    // print((dictionary["name"]! as? String)?.description)
                    self.navigationItem.title = dictionary["name"]! as? String
                    self.tableView.reloadData()
                }
                
            }, withCancel: nil)
        }
    }
    
    
    // Launch blu-ish view controller
    @objc func handleLogout() {
        
        do {
            try Auth.auth().signOut()
        
        } catch let logoutError {
            print(logoutError)
        }
            
        let loginController = LoginController()
        present(loginController, animated: true, completion: nil)
    }


}


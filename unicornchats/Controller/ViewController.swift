//
//  ViewController.swift
//  unicornchats
//
//  Created by Phyllis Wong on 2/1/18.
//  Copyright © 2018 Phyllis Wong. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
       
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "logout", style: .plain, target: self, action: #selector(handleLogout))
        
        // User is not logged in
        if Auth.auth().currentUser?.uid == nil {
            perform(#selector(handleLogout), with: nil, afterDelay: 0)
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


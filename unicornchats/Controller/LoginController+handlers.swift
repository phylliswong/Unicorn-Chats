//
//  LoginController+handlers.swift
//  unicornchats
//
//  Created by Phyllis Wong on 2/15/18.
//  Copyright © 2018 Phyllis Wong. All rights reserved.
//

import UIKit


extension LoginController {
    
    
    @objc func handleSelectProfileImageView() {
        // tap gestures perform these actions
        let picker = UIImagePickerController()
        present(picker, animated: true, completion: nil)
    }
    
}

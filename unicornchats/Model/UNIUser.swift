//
//  UNIUser.swift
//  unicornchats
//
//  Created by Phyllis Wong on 2/8/18.
//  Copyright © 2018 Phyllis Wong. All rights reserved.
//

import UIKit
import Firebase


class Users: NSObject {
    
    @objc var name: String?
    @objc var email: String?

//    init?(_ snapshot: DataSnapshot) {
//        guard
//            let dictionary = snapshot.value as! [String: AnyObject]?,
//            let nameValue = dictionary["name"] as! String?,
//            let emailValue = dictionary["email"] as! String?
//
//            else {
//                return nil
//            }
//
//        self.name = nameValue
//        self.email = emailValue
//    }
}

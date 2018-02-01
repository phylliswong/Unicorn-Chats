//
//  LoginController.swift
//  unicornchats
//
//  Created by Phyllis Wong on 2/1/18.
//  Copyright © 2018 Phyllis Wong. All rights reserved.
//

import UIKit

class LoginController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor(red: 61/255, green: 91/255, blue: 151/255, alpha: 1)
        self.setNeedsStatusBarAppearanceUpdate()
    }

    // Make the Status Bar Light/Dark Content for this View
    override var preferredStatusBarStyle : UIStatusBarStyle {
        return UIStatusBarStyle.lightContent
        //return UIStatusBarStyle.default   // Make dark again
    }
  

}

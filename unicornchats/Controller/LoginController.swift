//
//  LoginController.swift
//  unicornchats
//
//  Created by Phyllis Wong on 2/1/18.
//  Copyright © 2018 Phyllis Wong. All rights reserved.
//

import UIKit

class LoginController: UIViewController {
    
    // Create the container for user input
    let inputsContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.white
        
        // Must set this property for the anchors to work
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 5
        view.clipsToBounds = true
        return view
    }()
    
    let loginRegisterButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = UIColor(r: 80, g: 101, b: 161)
        button.setTitle("Register", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(UIColor.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.layer.cornerRadius = 3
        button.clipsToBounds = true
        return button
    }()
    
    let nameTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Name"
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
    let nameSeparatorView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(r: 220, g: 220, b: 220)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let emailTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Email address"
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
    let emailSeparatorView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(r: 220, g: 220, b: 220)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let passwordTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Password"
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()


    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor(r: 61, g: 91, b: 151)
        view.addSubview(inputsContainerView)
        view.addSubview(loginRegisterButton)
        
        setUpContainerView()
        setUpLoginRegisterButton()
    }
    
    func setUpContainerView() {
        // Need x, y, width, and height contraints
        inputsContainerView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        inputsContainerView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        // Will give the container 12 pixels on both the leading and trailing edge
        inputsContainerView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -24).isActive = true
        inputsContainerView.heightAnchor.constraint(equalToConstant: 150).isActive = true
        
        
        inputsContainerView.addSubview(nameTextField)
        inputsContainerView.addSubview(nameSeparatorView)
        inputsContainerView.addSubview(emailTextField)
        inputsContainerView.addSubview(emailSeparatorView)
        inputsContainerView.addSubview(passwordTextField)
        
        
            // Contraints: x, y, width, and height of Name field
            nameTextField.leftAnchor.constraint(equalTo: inputsContainerView.leftAnchor, constant: 12).isActive = true
            nameTextField.topAnchor.constraint(equalTo: inputsContainerView.topAnchor).isActive = true
            nameTextField.widthAnchor.constraint(equalTo: inputsContainerView.widthAnchor).isActive = true
            nameTextField.heightAnchor.constraint(equalTo: inputsContainerView.heightAnchor, multiplier: 1/3).isActive = true
        
                // Constraints for line below the Name
                nameSeparatorView.leftAnchor.constraint(equalTo: inputsContainerView.leftAnchor).isActive = true
                nameSeparatorView.topAnchor.constraint(equalTo: nameTextField.bottomAnchor).isActive = true
                nameSeparatorView.widthAnchor.constraint(equalTo: nameTextField.widthAnchor).isActive = true
                nameSeparatorView.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
            // Contraints: x, y, width, and height of Email field
            emailTextField.leftAnchor.constraint(equalTo: nameTextField.leftAnchor).isActive = true
            emailTextField.topAnchor.constraint(equalTo: nameSeparatorView.bottomAnchor).isActive = true
            emailTextField.widthAnchor.constraint(equalTo: nameTextField.widthAnchor).isActive = true
            emailTextField.heightAnchor.constraint(equalTo: nameTextField.heightAnchor).isActive = true
        
                // Constraints for line below the email
                emailSeparatorView.leftAnchor.constraint(equalTo: nameSeparatorView.leftAnchor).isActive = true
                emailSeparatorView.topAnchor.constraint(equalTo: emailTextField.bottomAnchor).isActive = true
                emailSeparatorView.widthAnchor.constraint(equalTo: emailTextField.widthAnchor).isActive = true
                emailSeparatorView.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
            // Constrain x, y, width, and height of Password text field
            passwordTextField.leftAnchor.constraint(equalTo: nameTextField.leftAnchor).isActive = true
            passwordTextField.topAnchor.constraint(equalTo: emailSeparatorView.bottomAnchor).isActive = true
            passwordTextField.widthAnchor.constraint(equalTo: emailTextField.widthAnchor).isActive = true
            passwordTextField.heightAnchor.constraint(equalTo: emailTextField.heightAnchor).isActive = true
        
        
    }
    
    func setUpLoginRegisterButton() {
        // Need x, y, width, and height contraints
        loginRegisterButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        loginRegisterButton.topAnchor.constraint(equalTo: inputsContainerView.bottomAnchor, constant: 12).isActive = true
        loginRegisterButton.widthAnchor.constraint(equalTo: inputsContainerView.widthAnchor).isActive = true
        loginRegisterButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }

    // Make the Status Bar Light/Dark Content for this View
    override var preferredStatusBarStyle : UIStatusBarStyle {
        return UIStatusBarStyle.lightContent
        //return UIStatusBarStyle.default   // Make dark again
    }
  

}


extension UIColor {
    convenience init(r: CGFloat, g: CGFloat, b: CGFloat) {
        self.init(red: r/255, green: g/255, blue: b/255, alpha: 1)
    }
}

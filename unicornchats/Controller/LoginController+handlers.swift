//
//  LoginController+handlers.swift
//  unicornchats
//
//  Created by Phyllis Wong on 2/15/18.
//  Copyright © 2018 Phyllis Wong. All rights reserved.
//

import UIKit
import Firebase


extension LoginController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @objc func handleRegister() {
        
        guard let email = emailTextField.text, let password = passwordTextField.text, let name = nameTextField.text else {
            print("Form is not valid")
            return
        }
        // call authentication fun from FirebaseAuth
        Auth.auth().createUser(withEmail: email, password: password) { (user: User?, error) in
            
            if error != nil {
                print(error!)
                return
            }
            
            guard let uid = user?.uid else {
                return
            }
            
            // Successfully authenticated user
            let storageRef = Storage.storage().reference().child("myImage.png")
            
            if let uploadData = UIImagePNGRepresentation(self.profileImageView.image!) {
                storageRef.putData(uploadData, metadata: nil, completion: { (metadata, error) in
                    
                    if error != nil {
                        print(error!)
                        return
                    }
                    
                    print(metadata!)
                })
            }
            
            
            
            
            
        }
    }
    
    private func registerUserIntoDatabase(uid: String, values: [String: AnyObject]) {
        let ref = Database.database().reference(fromURL: "https://unicornchats.firebaseio.com/")
        let usersReference = ref.child("users").child(uid)
        
//        let values = ["name": name, "email": email, "profileImage": metadata.downloadUrl]
        usersReference.updateChildValues(values, withCompletionBlock: { (err, ref) in
            if err != nil {
                print(err!)
                return
            }
            // Dissmiss view controller to view the appication
            // Saved user successfully into Firebase db
            self.dismiss(animated: true, completion: nil)
            
        })
    }
    
    @objc func handleSelectProfileImageView() {
        // allow users to select image from their photo library
        let picker = UIImagePickerController()
        
        picker.delegate = self
        picker.allowsEditing = true
        
        present(picker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        var selectedImageFromPicker: UIImage?
        
        if let editedImage = info["UIImagePickerControllerEditedImage"] as? UIImage {
            selectedImageFromPicker = editedImage
 
        } else if let originalImage = info["UIImagePickerControllerOriginalImage"] as? UIImage {
            selectedImageFromPicker = originalImage
            
        }
        
        if let selectedImage = selectedImageFromPicker {
            profileImageView.image = selectedImage
//            print(selectedImage)
        }
        
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        print("\ncanceled picker\n")
        dismiss(animated: true, completion: nil)
    }
    
    
    
  
    
}



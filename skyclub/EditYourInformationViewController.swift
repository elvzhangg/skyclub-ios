//
//  EditYourInformationViewController.swift
//  skyclub
//
//  Created by Louis on 2017/7/25.
//  Copyright © 2017年 Elvis Zhang. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase


class EditYourInformationViewController: UIViewController {
    
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var ageTextField: UITextField!
    @IBOutlet weak var sexTextField: UITextField!
    @IBOutlet weak var nextButton: UIButton!
    
    var chosenImage: UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.chosenImage = UIImage(named: "selfie sample")
        profileImageView.image = chosenImage
        nextButton.layer.cornerRadius=6
        
    }
    
    @IBAction func nextButtonTapped(_ sender: UIButton) {
        guard let firUser = Auth.auth().currentUser,
        let name = nameTextField.text,
        let age = ageTextField.text,
        let sex = sexTextField.text,
        !name.isEmpty,
        !age.isEmpty,
        !sex.isEmpty
            else { return }
        
        UserService.create(withUID: firUser.uid, name: name, sex: sex , age: age, image: chosenImage!) { (user) in
            guard let user = user else {
                // handle error
                // TODO
                print("Not Connected")
                return
            }
            
            User.setCurrent(user, writeToUserDefaults: true)
            
            let initialViewController = UIStoryboard.initialViewController(for: .main)
            self.view.window?.rootViewController = initialViewController
            self.view.window?.makeKeyAndVisible()
        }
    }
    
    func presentActionSheet() {
        // 1
        let alertController = UIAlertController(title: nil, message: "Where do you want to get your picture from?", preferredStyle: .actionSheet)
        
        // 2
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            let capturePhotoAction = UIAlertAction(title: "Take Photo", style: .default, handler: { action in
                self.presentImagePickerController(with: .camera)
            })
            
            alertController.addAction(capturePhotoAction)
        }
        
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            let uploadAction = UIAlertAction(title: "Upload from Library", style: .default, handler: { action in
                self.presentImagePickerController(with: .photoLibrary)
            })
            
            alertController.addAction(uploadAction)
        }
        // 6
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alertController.addAction(cancelAction)
        
        // 7
        self.present(alertController, animated: true)
    }

    
    func presentImagePickerController(with sourceType: UIImagePickerControllerSourceType) {
        let imagePickerController = UIImagePickerController()
        imagePickerController.sourceType = sourceType
        imagePickerController.delegate = self
        
        self.present(imagePickerController, animated: true)
    }
    
    @IBAction func editProfileImage(_ sender: Any) {
        self.presentActionSheet()
    }
    
}

extension EditYourInformationViewController: UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let selectedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            self.profileImageView.image = selectedImage
            self.chosenImage = selectedImage
        }
        
        picker.dismiss(animated: true)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true)
    }
}



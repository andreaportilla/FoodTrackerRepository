//
//  ViewController.swift
//  FoodTracker
//
//  Created by Andréa Portilla on 2018-10-25.
//  Copyright © 2018 Andréa Portilla. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    //MARK: Properties

    @IBOutlet weak var nameTextfield: UITextField!
    @IBOutlet weak var mealNameLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
   
        // Handle the text field’s user input through delegate callbacks.
        nameTextfield.delegate = self
        
    }

    //MARK: UITextFieldDelegate
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // Hide the keyboard.
        textField.resignFirstResponder()
        return true
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        mealNameLabel.text = textField.text
    }
    
    @IBAction func selectImageromPhotoLibrary(_ sender: UITapGestureRecognizer) {
        // Hide the keyboard.
        nameTextfield.resignFirstResponder()
        
        // UIImagePickerController is a view controller that lets a user pick media from their photo library.
        let imagePickerController = UIImagePickerController()
        
        // Only allow photos to be picked, not taken.
        imagePickerController.sourceType = .photoLibrary
        
        // Make sure ViewController is notified when the user picks an image.
        imagePickerController.delegate = self
        present(imagePickerController, animated: true, completion: nil)
    }
    
    //MARK: UIImagePickerControllerDelegate
    
        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            // Dismiss the picker if the user canceled.
            dismiss(animated: true, completion: nil)
            func imagePickerController(_ picker: UIImagePickerController,
                                       didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            
            // The info dictionary may contain multiple representations of the image. You want to use the original.
            guard let selectedImage = info[.originalImage] as? UIImage else {
                fatalError("Expected a dictionary containing an image, but was provided the following: \(info)")
            }
            
            // Set photoImageView to display the selected image.
            photoImageView.image = selectedImage
            
            // Dismiss the picker.
            dismiss(animated: true, completion: nil)
        }
        
    }
    
    //Mark: Actions
    @IBAction func setDefaultLabelText(_ sender: UIButton) {
        mealNameLabel.text = "Default Text"
    }
    
}


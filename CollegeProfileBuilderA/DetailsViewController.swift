//
//  DetailsViewController.swift
//  CollegeProfileBuilderA
//
//  Created by Bobby Solberg on 7/27/16.
//  Copyright © 2016 Bobby Solberg. All rights reserved.
//

import UIKit
import SafariServices

class DetailsViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate, SFSafariViewControllerDelegate {
    
    @IBOutlet weak var collegeTextField: UITextField!
    @IBOutlet weak var stateTextField: UITextField!
    @IBOutlet weak var enrollmentTextField: UITextField!
    @IBOutlet weak var websiteTextField: UITextField!
    @IBOutlet weak var imageView: UIImageView!

    var college: College!
    var imagePicker = UIImagePickerController()
    var urlString = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collegeTextField.text = college.name
        
        stateTextField.text = college.state
        
        enrollmentTextField.text = String(college.enrollment)
        
        websiteTextField.text = college.website
        
        imageView.image = college.image
        
    }
    @IBAction func onTappedSaveButton(sender: UIButton) {
        college.name = collegeTextField.text!
        
        college.state = stateTextField.text!
        
        college.enrollment = Int(enrollmentTextField.text!)!
        
        college.website = websiteTextField.text!
    }
    @IBAction func onTappedGoToSafari(sender: UIButton) {
        let url = NSURL(string: websiteTextField.text!)
        let svc = SFSafariViewController (URL: url!)
        presentViewController(svc, animated: true, completion: nil)
    
    }
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImageWithInfo info: [String : AnyObject]) { dismissViewControllerAnimated(true) {
            let selectedImage = info[UIImagePickerControllerOriginalImage] as! UIImage
            self.imageView.image = selectedImage
        }
    }
    @IBAction func onTappedLibraryButton(sender: UIButton) {
        imagePicker.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        presentViewController(imagePicker, animated: true, completion: nil)
    }
    @IBAction func onTappedCameraButton(sender: UIButton) {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.Camera) {
            imagePicker.sourceType = UIImagePickerControllerSourceType.Camera
            presentViewController(imagePicker, animated: true, completion: nil)
        }
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let dvc = segue.destinationViewController as! MapViewController
    
        dvc.data = college.name
    }
}
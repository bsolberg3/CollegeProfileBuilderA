//
//  DetailsViewController.swift
//  CollegeProfileBuilderA
//
//  Created by Bobby Solberg on 7/27/16.
//  Copyright © 2016 Bobby Solberg. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {
    @IBOutlet weak var collegeTextField: UITextField!
    @IBOutlet weak var stateTextField: UITextField!
    @IBOutlet weak var enrollmentTextField: UITextField!
    @IBOutlet weak var imageView: UIImageView!

    var college: College!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collegeTextField.text = college.name
        
        stateTextField.text = college.state
        
        enrollmentTextField.text = String(college.enrollment)
        
        imageView.image = college.image
        
    }
    @IBAction func onTappedSaveButton(sender: UIButton) {
        college.name = collegeTextField.text!
        
        college.state = stateTextField.text!
        
        college.enrollment = Int(enrollmentTextField.text!)!
    }
//
//  MapViewController.swift
//  CollegeProfileBuilderA
//
//  Created by Bobby Solberg on 7/29/16.
//  Copyright © 2016 Bobby Solberg. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController, UITextFieldDelegate {
        
    @IBOutlet weak var mapTextField: UITextField!
    @IBOutlet weak var mapViewController: MKMapView!
        var data = ""
        
        override func viewDidLoad() {
            super.viewDidLoad()
            mapTextField.text = data
            mapTextField.delegate = self
            textFieldShouldReturn(mapTextField)
            
            
        }
        func textFieldShouldReturn(textField: UITextField) -> Bool {
            let geocoder = CLGeocoder()
            geocoder.geocodeAddressString(textField.text!) { (placemarks, error) in
                if error != nil{
                    print(error)
                }
                else{
                    if placemarks!.count > 1{
                        let actionController = UIAlertController(title: "Select a Location", message: nil, preferredStyle: UIAlertControllerStyle.ActionSheet)
                        for i in 0..<placemarks!.count{
                            let anOption = UIAlertAction(title: "\(self.mapTextField.text!), \(placemarks![i].administrativeArea!)", style: .Default) { (action) in
                                let placemark : CLPlacemark = placemarks![i] as CLPlacemark!
                                let center = placemark.location!.coordinate
                                let span = MKCoordinateSpanMake(0.1, 0.1)
                                self.displayMap(center, span: span, pinTitle: self.mapTextField.text!)
                            }
                            actionController.addAction(anOption)
                        }
                        let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel, handler: nil)
                        actionController.addAction(cancelAction)
                        self.presentViewController(actionController, animated: true, completion: nil)
                    }
                    else{
                        let placemark = placemarks!.first as CLPlacemark!
                        let center = placemark.location!.coordinate
                        let span = MKCoordinateSpanMake(0.1, 0.1)
                        self.displayMap(center, span: span, pinTitle: self.mapTextField.text!)
                        
                    }
                    
                }
            }
            
            return true
        }
        
        func displayMap(center: CLLocationCoordinate2D, span: MKCoordinateSpan, pinTitle: String) {
            let region = MKCoordinateRegionMake(center, span)
            let pin = MKPointAnnotation()
            pin.coordinate = center
            pin.title = pinTitle
            self.mapViewController.addAnnotation(pin)
            self.mapViewController.setRegion(region, animated: true)
            let actionController = UIAlertController(title: "Select an option", message: nil, preferredStyle: .ActionSheet)
            
            let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel, handler: nil)
            
            actionController.addAction(cancelAction)
    

            
            self.presentViewController(actionController, animated: true, completion: nil)
        }


}
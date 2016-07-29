//
//  ViewController.swift
//  CollegeProfileBuilderA
//
//  Created by Bobby Solberg on 7/27/16.
//  Copyright © 2016 Bobby Solberg. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myTableView: UITableView!
    @IBOutlet weak var editButton: UIBarButtonItem!
    var colleges = [College]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        editButton.tag = 0
        colleges.append(College(name: "University of Miami", state: "Florida", enrollment: 9979, image: UIImage(named: "UofM")!))
        colleges.append(College(name: "University of Arizona", state: "Arizona", enrollment: 28210, image: UIImage(named: "UofA")!))
        colleges.append(College(name: "University of Texas-Austin", state: "Texas", enrollment: 39523, image: UIImage(named: "UTAustin")!))
        
 
        
    }
}

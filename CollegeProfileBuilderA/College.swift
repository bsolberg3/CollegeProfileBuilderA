//
//  College.swift
//  CollegeProfileBuilderA
//
//  Created by Bobby Solberg on 7/29/16.
//  Copyright © 2016 Bobby Solberg. All rights reserved.
//

import UIKit

class College: NSObject {
    var name = ""
    var state = ""
    var enrollment = 0
    var website = ""
    var image = UIImage(named: "Default")
    
    convenience init(name: String, state: String, enrollment: Int, website: String, image: UIImage) {
        self.init()
        self.name = name
        self.state = state
        self.enrollment = enrollment
        self.website = website
        self.image = image
    }
    
    convenience init(name: String) {
        self.init()
        self.name = name
    }
}

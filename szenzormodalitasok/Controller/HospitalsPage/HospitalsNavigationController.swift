//
//  HospitalsNavigationController.swift
//  szenzormodalitasok
//
//  Created by Tóth Zoltán on 2021. 05. 09..
//  Copyright © 2021. Tóth Zoltán. All rights reserved.
//

// Imports
import UIKit

// HospitalsNavigationController class
class HospitalsNavigationController : UINavigationController {
    
    // viewDidLoad func
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // awakeFromNib func
    override func awakeFromNib() {
        super.awakeFromNib()
        tabBarItem.title    = NSLocalizedString("hospitalsTab.title", comment: "")
    }
}

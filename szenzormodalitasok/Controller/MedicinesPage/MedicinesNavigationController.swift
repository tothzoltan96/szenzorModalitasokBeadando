//
//  MedicinesNavigationController.swift
//  szenzormodalitasok
//
//  Created by Tóth Zoltán on 2021. 05. 08..
//  Copyright © 2021. Tóth Zoltán. All rights reserved.
//

// Imports
import UIKit

// MedicinesNavigationController class
class MedicinesNavigationController : UINavigationController {
    
    // viewDidLoad func
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // awakeFromNib func
    override func awakeFromNib() {
        super.awakeFromNib()
        tabBarItem.title    = NSLocalizedString("medicinesTab.title", comment: "")
    }
}

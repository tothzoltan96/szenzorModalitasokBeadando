//
//  SettingsNavigationController.swift
//  szenzormodalitasok
//
//  Created by Tóth Zoltán on 2021. 05. 11..
//  Copyright © 2021. Tóth Zoltán. All rights reserved.
//

// Imports
import UIKit

// SettingNacigationController class
class SettingsNavigationController : UINavigationController {
    
    // viewDidLoad func
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // awakeFromNib func
    override func awakeFromNib() {
        super.awakeFromNib()
        tabBarItem.title    = NSLocalizedString("settingsTab.title", comment: "")
    }
}

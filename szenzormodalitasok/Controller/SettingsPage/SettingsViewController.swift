//
//  SettingViewController.swift
//  szenzormodalitasok
//
//  Created by Tóth Zoltán on 2021. 05. 11..
//  Copyright © 2021. Tóth Zoltán. All rights reserved.
//

// Imports
import UIKit

// Setting page - UIViewController
class SettingsViewController: UIViewController {
    
    // IB Outlets
    @IBOutlet weak var medicinesUpdateButton: CustomSettingsButton!
    @IBOutlet weak var otherOptionsButton: CustomSettingsButton!
    @IBOutlet weak var contactsLabel: UILabel!
    @IBOutlet weak var eMailLabel: UILabel!
    @IBOutlet weak var phoneNumberLabel: UILabel!
    @IBOutlet weak var versionNumberLabel: UILabel!
    @IBOutlet weak var copyrightLabel: UILabel!
    
    // viewDidLoad func
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title                           = NSLocalizedString("settingsTab.title", comment: "")
        
        medicinesUpdateButton.setButtonTitle(NSLocalizedString("settingsTab.updateMedicinesButton.title", comment: ""))
        otherOptionsButton.setButtonTitle(NSLocalizedString("settingsTab.otherOptionsButton.title", comment: ""))
        contactsLabel.text              = NSLocalizedString("settingsTab.contactsLabel.title", comment: "")
        eMailLabel.text                 = NSLocalizedString("settingsTab.contactsEMailLabel.title", comment: "")
        phoneNumberLabel.text           = NSLocalizedString("settingsTab.contactsPhoneNumberLabel.title", comment: "")
        versionNumberLabel.text         = NSLocalizedString("settingsTab.versionNumberLabel.title", comment: "")
        copyrightLabel.text             = NSLocalizedString("settingsTab.copyRightLabel.title", comment: "")
    }
    
    // IB Actions
    
    // This method called, when medicineUpdateButton tapped
    @IBAction func MedicinesUpdateButtonTapped(_ sender: CustomSettingsButton) {
        let alert = UIAlertController(title: NSLocalizedString("warningMessage", comment: ""), message: NSLocalizedString("settingsTan.updateMedicinesAlertTitle.title", comment: ""), preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: NSLocalizedString("cancelMessage", comment: ""), style: .cancel, handler: nil))
        alert.addAction(UIAlertAction(title: NSLocalizedString("accpetedMessage", comment: ""), style: .destructive, handler: { (action) -> Void in
            self.medicinesUpdateButton.shake()
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    // This method called, when otherOptionsButton tapped
    @IBAction func OtherOptionsButtonTapped(_ sender: CustomSettingsButton) {
        let alert = UIAlertController(title: NSLocalizedString("informationMassage", comment: ""), message: NSLocalizedString("settingsTab.otherOptionsAlertTitle.title", comment: ""), preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: NSLocalizedString("cancelMessage", comment: ""), style: .cancel, handler: nil))
        alert.addAction(UIAlertAction(title: NSLocalizedString("accpetedMessage", comment: ""), style: .destructive, handler: { (action) -> Void in
            self.otherOptionsButton.shake()
        }))
        self.present(alert, animated: true, completion: nil)
    }
}

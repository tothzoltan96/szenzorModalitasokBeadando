//
//  DosageVC.swift
//  szenzormodalitasok
//
//  Created by Tóth Zoltán on 2021. 05. 09..
//  Copyright © 2021. Tóth Zoltán. All rights reserved.
//

// Imports
import UIKit

// Dosage page - UIViewController
class DosageViewController: UIViewController, UITextFieldDelegate {
    
    // Struct
    struct Args {
        var medicineName: String
    }
    
    // Variables
    var medicineNameArgs = Args(medicineName: "")
    
    // IB Outlets
    @IBOutlet weak var medicineDosageSubTitle: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var dosageLabel: UILabel!
    @IBOutlet weak var weightTextField: UITextField!
    @IBOutlet weak var dosageRecommendedNumber: UITextField!
    @IBOutlet weak var weightDeleteButton: CustomDosageButton!
    
    // viewDidLoad func
    override func viewDidLoad() {
        super.viewDidLoad()
        title = NSLocalizedString("medicineDosage.title", comment: "")
        medicineDosageSubTitle.text = medicineNameArgs.medicineName
        weightLabel.text = NSLocalizedString("medicineDosageWeight.title", comment: "")
        dosageLabel.text = NSLocalizedString("medicineDosageDosage.title", comment: "")
        weightDeleteButton.setButtonTitle(NSLocalizedString("medicineDosageWeightDelete.title" , comment: ""))
        weightTextField.delegate = self
    }
    
    // viewDidAppear func
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        weightTextField.becomeFirstResponder()/*
        weightTextField.addTarget(self, action: #Selector(textFieldDidC), for: .editingChanged)*/
    }
    
    // Functions
    func textFieldDidChangeSelection(_ textField: UITextField) {
        if weightTextField.text == "" {
            dosageRecommendedNumber.text = "0000"
        } else {
            dosageRecommendedNumber.text = weightTextField.text
        }
    }
    
    // IB Actions
    @IBAction func weightDeleteButtonTapped(_ sender: Any) {
        weightTextField.text = ""
    }
}

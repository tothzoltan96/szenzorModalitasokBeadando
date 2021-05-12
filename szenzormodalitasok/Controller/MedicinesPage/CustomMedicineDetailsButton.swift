//
//  CustomMedicineDetailsButton.swift
//  szenzormodalitasok
//
//  Created by Tóth Zoltán on 2021. 05. 08..
//  Copyright © 2021. Tóth Zoltán. All rights reserved.
//

// Imports
import UIKit

// CustomMedicineDetailsButton class
class CustomMedicineDetailsButton: UIButton {
    
    // Initializing
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButton()
    }
    
    // Initializing
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupButton()
    }
    
    // Button settings
    private func setupButton() {
        titleLabel?.font    = UIFont.boldSystemFont(ofSize: 20)
    }
    
    // Function for set the button title
    func setButtonTitle(_ title: String?) {
        setTitle(title, for: .normal)
    }
}

//
//  CustomDosageButton.swift
//  szenzormodalitasok
//
//  Created by Tóth Zoltán on 2021. 05. 08..
//  Copyright © 2021. Tóth Zoltán. All rights reserved.
//

// Imports
import UIKit

// CustomDosageButton class
class CustomDosageButton : UIButton {
    
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
        backgroundColor     = Colors.appLightBlue
        titleLabel?.font    = UIFont.boldSystemFont(ofSize: 25)
        layer.borderWidth   = 2
        layer.borderColor   = Colors.appBlue.cgColor
    }
    
    // Function for set the button title
    func setButtonTitle(_ title: String?) {
        setTitle(title, for: .normal)
    }
}

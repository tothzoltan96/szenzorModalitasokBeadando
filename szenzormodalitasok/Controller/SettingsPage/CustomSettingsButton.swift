//
//  CustomSettingsButton.swift
//  szenzormodalitasok
//
//  Created by Tóth Zoltán on 2021. 05. 11..
//  Copyright © 2021. Tóth Zoltán. All rights reserved.
//

// Imports
import UIKit

// My custom setting button class
class CustomSettingsButton: UIButton {
    
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
        setShadow()
        setTitleColor(.red, for: .normal)
        backgroundColor     = Colors.appLightBlue
        titleLabel?.font    = UIFont.boldSystemFont(ofSize: 16)
        layer.cornerRadius  = 15
        layer.borderWidth   = 1.5
        layer.borderColor   = Colors.appBlue.cgColor
    }
    
    // Button's shadow
    func setShadow() {
        layer.shadowColor   = Colors.appBlue.cgColor
        layer.shadowOffset  = CGSize(width: 0.0, height: 6.0)
        layer.shadowRadius  = 8
        layer.shadowOpacity = 0.5
        clipsToBounds       = true
        layer.masksToBounds = false
    }
    
    // Function for set the button title
    func setButtonTitle(_ title: String?) {
        setTitle(title, for: .normal)
    }
    
    // Function if button get tapped
    func shake() {
        let shake           = CABasicAnimation(keyPath: "position")
        shake.duration      = 0.1
        shake.repeatCount   = 2
        shake.autoreverses  = true
        
        let fromPoint       = CGPoint(x: center.x - 8, y: center.y)
        let fromValue       = NSValue(cgPoint: fromPoint)
        
        let toPoint         = CGPoint(x: center.x + 8, y: center.y)
        let toValue         = NSValue(cgPoint: toPoint)
        
        shake.fromValue     = fromValue
        shake.toValue       = toValue
        
        layer.add(shake, forKey: "position")
    }
}

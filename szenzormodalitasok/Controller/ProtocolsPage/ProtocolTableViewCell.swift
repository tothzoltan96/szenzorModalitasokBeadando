//
//  ProtocolTableViewCell.swift
//  szenzormodalitasok
//
//  Created by Tóth Zoltán on 2021. 05. 09..
//  Copyright © 2021. Tóth Zoltán. All rights reserved.
//

// Imports
import UIKit

// Protocol Table View Cell
class ProtocolTableViewCell: UITableViewCell {
    
    func display(protocolModel: ProtocolModel) {
        
        textLabel?.text             = protocolModel.name
        textLabel?.numberOfLines    = 2
        
        imageView?.image            = UIImage(systemName: "staroflife.fill")
        
        tintColor                   = .red
        selectionStyle              = UITableViewCell.SelectionStyle.none
    }
}

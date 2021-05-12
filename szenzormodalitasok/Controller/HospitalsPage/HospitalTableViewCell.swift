//
//  HospitalTableViewCell.swift
//  szenzormodalitasok
//
//  Created by Tóth Zoltán on 2021. 05. 11..
//  Copyright © 2021. Tóth Zoltán. All rights reserved.
//

// Imports
import UIKit

// Custom hospital table view cell class
class HospitalTableViewCell: UITableViewCell{
    
    // IB Outlets
    @IBOutlet weak var hospitalIcon: UIImageView!
    @IBOutlet weak var distanceLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var secondTitleLabel: UILabel!
    
    // Display custom cell when hospital table view cell create
    func display(hospitalModel: HospitalModel) {
        
        tintColor                   = .red
        selectionStyle              = UITableViewCell.SelectionStyle.none
        
        titleLabel.text             = hospitalModel.name
        titleLabel.textColor        = Colors.appBlue
        titleLabel.numberOfLines    = 2
        
        hospitalIcon.image          = UIImage(named: "hospital.fill")
        hospitalIcon.tintColor      = .red
        
        secondTitleLabel.text       = hospitalModel.hospitalSCountry
        secondTitleLabel.font       = UIFont.systemFont(ofSize: 13, weight: .regular)
        secondTitleLabel.textColor  = .red
        
        if hospitalModel.distanceFromUser < 10000 {
            distanceLabel.font      = UIFont.systemFont(ofSize: 20, weight: .medium)
            distanceLabel.textColor = .red
            distanceLabel.text      = String(format: "%.0f", Double(hospitalModel.distanceFromUser)) + " m"
        } else {
            distanceLabel.font      = UIFont.systemFont(ofSize: 17, weight: .regular)
            distanceLabel.textColor = Colors.appBlue
            distanceLabel.text      = String(format: "%.1f", Double(hospitalModel.distanceFromUser/1000)) + " km"
        }
    }
}

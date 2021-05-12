//
//  HospitalsViewController+presenting.swift
//  szenzormodalitasok
//
//  Created by Tóth Zoltán on 2021. 05. 11..
//  Copyright © 2021. Tóth Zoltán. All rights reserved.
//

// Imports
import Foundation
import UIKit
import CoreLocation

// HospitlasPresenting protocol
protocol HospitalsPresenting {
    func displayTitle()
    func display(_ hospitals: [HospitalModel])
}

// MARK: - HospitalsPrenting

// HospitalsPresenting protocol for extension implement here
extension HospitalsViewController: HospitalsPresenting {
    
    // Variables
    var presenter: HospitalsPresenting {
        self
    }
    
    // Set the page title here
    func displayTitle() {
        title = NSLocalizedString("hospitalsTab.title", comment: "")
    }
    
    // Displaying the hospitalModel array here
    func display(_ hospitals: [HospitalModel]) {
        self.hospitals = hospitals
        calculateDistance()
        hospitalTableView.reloadData()
    }
}

//MARK: - UITableViewDataSource

// UITableViewDataSource delegate implement here
extension HospitalsViewController: UITableViewDataSource {
    
    // Number of raw in a section
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        hospitals.count
    }
    
    // Displaying a cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "hospitalCell") as? HospitalTableViewCell else {
            return UITableViewCell()
        }
        let hospitalModel = hospitals[indexPath.row]
        cell.display(hospitalModel: hospitalModel)
        return cell
    }
}

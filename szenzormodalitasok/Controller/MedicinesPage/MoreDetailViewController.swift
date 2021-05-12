//
//  moreDetailViewController.swift
//  szenzormodalitasok
//
//  Created by Tóth Zoltán on 2021. 05. 07..
//  Copyright © 2021. Tóth Zoltán. All rights reserved.
//

// Imports
import UIKit

// MoreDetailsViewController class
class MoreDetailViewController: UIViewController {
    
    // Struct
    struct Args {
        var oneMedicineDetail: String
    }
    
    // Variables
    var medicineDetailArgs = Args(oneMedicineDetail: "")
    
    // IB Outlets
    @IBOutlet weak var scrollViewDetail: UIScrollView!
    @IBOutlet weak var detailLabel: UILabel!
    
    // viewDidLoad Function
    override func viewDidLoad() {
        super.viewDidLoad()
        detailLabel.text = medicineDetailArgs.oneMedicineDetail
    }
}

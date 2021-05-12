//
//  HospitalViewController.swift
//  szenzormodalitasok
//
//  Created by Tóth Zoltán on 2021. 05. 09..
//  Copyright © 2021. Tóth Zoltán. All rights reserved.
//

// Imports
import UIKit
import CoreLocation

// Hospital page - UIViewController
class HospitalsViewController: UIViewController, ProvidingInjecting, UITableViewDelegate {
    
    // Args struct
    struct Args {
        var pageSource: PageSource
    }
    
    // Variables
    var hospitalArgs = Args(pageSource: .hospitals)
    private(set) lazy var hospitalProvider: HospitalProviding = {
        hospitalInject()
    }()
    var hospitals = [HospitalModel]()
    
    private var locationManager: CLLocationManager!
    private var lastKnownLocation: CLLocation?
    private var filterString: String?
    
    // IB Outlets
    @IBOutlet weak var informationLabel: UILabel!
    @IBOutlet weak var hospitalTableView: UITableView!
    
    // viewDidLoad func
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupLocationManager()
        
        controller.start()
        
        informationLabel.text               = NSLocalizedString("hospitalsTab.informationLabel.title", comment: "")
        hospitalTableView.dataSource        = self
        hospitalTableView.delegate          = self
        hospitalTableView.backgroundColor   = .white
        hospitalTableView.rowHeight         = 70.0
    }
    
    // MARK: - Hospital functions here
    
    // Set up our LocationManager
    private func setupLocationManager() {
        if (CLLocationManager.locationServicesEnabled()) {
            locationManager = CLLocationManager()
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.requestWhenInUseAuthorization()
            locationManager.startUpdatingLocation()
        }
    }
    
    // Distance calculate method + sort method called -> Located and sorted locations available after that
    func calculateDistance() {
        hospitals = hospitals.map {
            HospitalModel(
                name: $0.name,
                hospitalSCountry: $0.hospitalSCountry,
                latitude: $0.latitude,
                longitude: $0.longitude,
                distanceFromUser: lastKnownLocation?.distance(from: CLLocation(latitude: $0.latitude, longitude: $0.longitude)) ?? 0)
        }
        sortHospitalList()
    }
   
    // Sort the array by distanceFromUser property
    private func sortHospitalList() {
        self.hospitals.sort { (hospital1, hospital2) -> Bool in
            hospital1.distanceFromUser < hospital2.distanceFromUser
        }
    }
}

//MARK: - CLLocationManagerDelegate

// LocationManagerDelegate implement here
extension HospitalsViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        lastKnownLocation = locations.last
        calculateDistance()
        hospitalTableView.reloadData()
    }
}

//
//  MedicineViewController.swift
//  szenzormodalitasok
//
//  Created by Tóth Zoltán on 2021. 05. 08..
//  Copyright © 2021. Tóth Zoltán. All rights reserved.
//

// Imports
import UIKit

// Medicines page - UIViewController
class MedicinesViewController: UIViewController, ProvidingInjecting, UITableViewDelegate {
    
    // Args struct
    struct Args {
        var pageSource: PageSource
    }
    
    // Variables
    var args = Args(pageSource: .medicines)
    private(set) lazy var medicineProvier: MedicineProviding = {
        medicineInject(pageSource: args.pageSource)
    }()
    private(set) lazy var favouriteProvider: FavouriteProviding = {
        favouriteInject()
    }()
    private var filterString: String?
    
    // IB Outlets
    @IBOutlet weak var medicineSearchBar: UISearchBar!
    @IBOutlet weak var medicineQrCodeReaderButton: UIButton!
    @IBOutlet weak var medicineTableView: UITableView!
    
    // For grouped list variables
    var medicinesDictionary                                 = [String: [MedicineModel]]()
    var sectionLetters                                      = [String]()
    var medicines                                           = [MedicineModel]()
    
    // viewDidLoad method
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if navigationController is FavouritesNavigationController {
            args.pageSource = .favourites
        }
        
        controller.start(with: args.pageSource)
        self.dismissKey()
        
        medicineSearchBar.delegate                          = self
        medicineSearchBar.enablesReturnKeyAutomatically     = true
        medicineSearchBar.placeholder                       = NSLocalizedString("medicinesTab.searchBar.placeholder.text", comment: "")
        medicineSearchBar.searchTextField.backgroundColor   = Colors.appBlue
        medicineSearchBar.searchTextField.textColor         = .white
        medicineSearchBar.searchTextField.tintColor         = .white
        medicineSearchBar.image(for: .search, state: .normal)
        
        medicineTableView.sectionIndexBackgroundColor       = .white
        medicineTableView.backgroundColor                   = .white
        medicineTableView.tintColor                         = .red
        medicineTableView.dataSource                        = self
        medicineTableView.delegate                          = self
    }
    
    func selectionCalculator(medicines: [MedicineModel]) {
        medicinesDictionary = [ : ]
        for medicineItem in medicines {
            let medicineKey = String(medicineItem.medicineName.prefix(1))
            if var medicineValues = medicinesDictionary[medicineKey] {
                medicineValues.append(medicineItem)
                medicinesDictionary[medicineKey] = medicineValues
            } else {
                medicinesDictionary[medicineKey] = [medicineItem]
            }
        }
        sectionLetters = medicinesDictionary.keys.sorted()
    }
    
    func calculateDisplayingModel() {
        selectionCalculator(medicines: medicines.filter{ self.filterString == nil ? true : $0.medicineName.uppercased().starts(with: self.filterString!.uppercased())})
        if sectionLetters.count == 1 {
            let key = sectionLetters[0]
            if medicinesDictionary[key]?.count == 1 {
                performSegue(withIdentifier: "showMedicineDetailFromMedicines", sender: medicinesDictionary[key]?[0])
            }
        }
    }

}

//MARK: - MedicinesViewController - #1 Extension: Hide keyboard

extension MedicinesViewController {
    func dismissKey() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(MedicinesViewController.dismissKeyboard))
        tap.cancelsTouchesInView        = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}

//MARK: - UISearchBarDelegate

extension MedicinesViewController: UISearchBarDelegate {
    
    // run when user choose a letter from keyboard -> searchText changed
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filterString = searchText.isEmpty ? nil : searchText
        calculateDisplayingModel()
        medicineTableView.reloadData()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        medicineSearchBar.resignFirstResponder()
    }
}

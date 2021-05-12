//
//  MedicinesViewController+presenting.swift
//  szenzormodalitasok
//
//  Created by Tóth Zoltán on 2021. 05. 07..
//  Copyright © 2021. Tóth Zoltán. All rights reserved.
//

import Foundation
import UIKit

protocol MedicinesPresenting {
    func displayTitle(by pageSource: PageSource)
    func display(_ medicines: [MedicineModel])
}

// MARK: - MedicinePresenting

extension MedicinesViewController: MedicinesPresenting {
    
    var presenter: MedicinesPresenting {
        self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if args.pageSource == .favourites {
            gatherMedicines()
        }
    }
    
    func displayTitle(by pageSource: PageSource) {
        if pageSource == .medicines {
            title = NSLocalizedString("medicinesTab.title", comment: "")
        } else {
            title = NSLocalizedString("favouritesTab.title", comment: "")
        }
    }
    
    func display(_ medicines: [MedicineModel]) {
        self.medicines = medicines
        self.medicines.sort { (medicineModel1, medicineModel2) -> Bool in
            medicineModel1.medicineName < medicineModel2.medicineName
        }
        selectionCalculator(medicines: self.medicines)
        medicineTableView.reloadData()
    }
}

// MARK: - UITableViewDataSource

// UITableViewDataSource protocol implement here
extension MedicinesViewController: UITableViewDataSource {
    
    // Number of raw in a section
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let key = sectionLetters[section]
        return medicinesDictionary[key]?.count ?? 0
    }
    
    // Displaying a cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "medicineCell") as? MedicineTableViewCell else {
            return UITableViewCell()
        }
        let key = sectionLetters[indexPath.section]
        
        let medicineModel = medicinesDictionary[key]?[indexPath.row] ?? MedicineModel.empty
        cell.display(medicineModel: medicineModel)
        return cell
    }
    
    // Swipe to right
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        guard args.pageSource == .medicines else { return nil }
        
        let action = UIContextualAction(style: .normal, title: "Show") { (ac:UIContextualAction, view:UIView, success:(Bool) -> Void) in
            let key = self.sectionLetters[indexPath.section]
            if let medicine = self.medicinesDictionary[key]?[indexPath.row] {
                self.favouriteProvider.add(medicineID: medicine.medicineID)
            }
            success(true)
        }
        
        action.image = UIImage(systemName: "plus")
        action.backgroundColor = Colors.appBlue
        
        return UISwipeActionsConfiguration(actions: [action])
    }
    
    // Delete func
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        guard args.pageSource == .favourites else { return }
        
        if editingStyle == .delete {
            let alert = UIAlertController(title: "Kedvenc törlése", message: "Biztosan törli a kedvencek közül? (Csak a kedvencek közül törlődik, a gyógyszerek közül nem.)", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "Igen", style: .destructive, handler: { (action) -> Void in
                let key = self.sectionLetters[indexPath.section]
                if let medicineModel = self.medicinesDictionary[key]?[indexPath.row] {
                    self.favouriteProvider.remove(medicineID: medicineModel.medicineID)
                    self.gatherMedicines()
                }
            }))
            alert.addAction(UIAlertAction(title: "Nem", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        } else if editingStyle == .delete {
            print("hello")
        }
    }
    
    // Header - Letters
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        sectionLetters[section]
    }
    
    // Header - Group Letters
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        let header                  = view as! UITableViewHeaderFooterView
        header.textLabel?.font      = UIFont.systemFont(ofSize: 25, weight: UIFont.Weight.medium)
        header.textLabel?.textColor = .red
    }
    
    // Selected a row from table view
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let key = sectionLetters[indexPath.section]
        performSegue(withIdentifier: "showMedicineDetailFromMedicines", sender: medicinesDictionary[key]?[indexPath.row])
    }
    
    // Data to a new segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let medicineDetailViewer = segue.destination as? MedicineDetailsViewController, let medicineDetailModel = sender as? MedicineModel else {
            return
        }
        medicineDetailViewer.medicineDetailArgs.medicineModel = medicineDetailModel
        medicineDetailViewer.medicineDetailArgs.pageSource = args.pageSource
    }
    
    // Right side - Section's number
    func numberOfSections(in tableView: UITableView) -> Int {
        sectionLetters.count
    }
    
    // Right side - Section's letter
    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        sectionLetters
    }
}

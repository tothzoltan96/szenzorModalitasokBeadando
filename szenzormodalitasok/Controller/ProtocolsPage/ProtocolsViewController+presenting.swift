//
//  ProtocolListdisplaying.swift
//  szenzormodalitasok
//
//  Created by Tóth Zoltán on 2021. 05. 09..
//  Copyright © 2021. Tóth Zoltán. All rights reserved.
//

// Imports
import Foundation
import UIKit

// ProtocolsPresenting protocol
protocol ProtocolsPresenting {
    func displayTitle()
    func display(_ protocols: [ProtocolModel])
}

//MARK: - ProtocolsPresenting

// ProtocolsPresenting protocol for extension implement here
extension ProtocolsViewController: ProtocolsPresenting {
    
    // Variables
    var presenter: ProtocolsPresenting {
        self
    }
    
    // Set the page title here
    func displayTitle() {
        title = NSLocalizedString("protocolsTab.title", comment: "")
    }
    
    // Displaying the hospitalModel array here
    func display(_ protocols: [ProtocolModel]) {
        self.protocols = protocols
        self.protocols.sort { (protocolModel1, protocolModel2) -> Bool in
            return protocolModel1.name < protocolModel2.name
        }
        selectionCalculator(protocols: self.protocols)
        protocolTableView.reloadData()
    }
}

//MARK: - UITableViewDataSource

extension ProtocolsViewController: UITableViewDataSource {
    
    // Number of raw in a section
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let key = sectionLetters[section]
        return protocolsDictionary[key]?.count ?? 0
    }
    
    // Displaying a cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "protocolCell") as? ProtocolTableViewCell else {
            return UITableViewCell()
        }
        let key = sectionLetters[indexPath.section]
        
        let protocolModel = protocolsDictionary[key]?[indexPath.row] ?? ProtocolModel.empty
        cell.display(protocolModel: protocolModel)
        return cell
    }
    
    // Header - Letters
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        sectionLetters[section]
    }
    
    // Header - Group letter
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        let header                  = view as! UITableViewHeaderFooterView
        header.textLabel?.font      = UIFont.systemFont(ofSize: 25, weight: UIFont.Weight.medium)
        header.textLabel?.textColor = .red
    }
    
    // Selected a row from table view
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let key = sectionLetters[indexPath.section]
        performSegue(withIdentifier: "showProtocol", sender: protocolsDictionary[key]?[indexPath.row].url)
    }
    
    // Data to a new segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let pdfViewer = segue.destination as? ProtocolShowViewController, let urlString = sender as? String else {
            return
        }
        pdfViewer.pdfArgs.url = urlString
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

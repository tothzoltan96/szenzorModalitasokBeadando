//
//  ProtocolViewController.swift
//  szenzormodalitasok
//
//  Created by Tóth Zoltán on 2021. 05. 09..
//  Copyright © 2021. Tóth Zoltán. All rights reserved.
//

// Imports
import UIKit

// Protocol page - UIViewController
class ProtocolsViewController: UIViewController, ProvidingInjecting, UITableViewDelegate {
    
    // Args struct
    struct Args {
        var pageSource: PageSource
    }
    
    // Variables
    var protocolArgs = Args(pageSource: .protocols)
    private(set) lazy var protocolProvider: ProtocolProviding = {
        protocolInject()
    }()
    private var filterString: String?
    
    // IB Outlets
    @IBOutlet weak var protocolSearchBar: UISearchBar!
    @IBOutlet weak var protocolTableView: UITableView!
    
    // For grouped list variables
    var protocolsDictionary                                 = [String: [ProtocolModel]]()
    var sectionLetters                                      = [String]()
    var protocols                                           = [ProtocolModel]()
    
    // viewDidLoad func
    override func viewDidLoad() {
        super.viewDidLoad()
        
        controller.start()
        
        self.dismissKey()
        
        protocolSearchBar.delegate                          = self
        protocolSearchBar.enablesReturnKeyAutomatically     = true
        protocolSearchBar.placeholder                       = NSLocalizedString("protocolsTab.searchBar.placeholder.text", comment: "")
        protocolSearchBar.searchTextField.backgroundColor   = Colors.appBlue
        protocolSearchBar.searchTextField.textColor         = .white
        protocolSearchBar.searchTextField.tintColor         = .white
        protocolSearchBar.image(for: .search, state: .normal)
        
        protocolTableView.sectionIndexBackgroundColor       = .white
        protocolTableView.backgroundColor                   = .white
        protocolTableView.tintColor                         = .red
        protocolTableView.dataSource                        = self
        protocolTableView.delegate                          = self
    }
    
    // Functions
    func selectionCalculator(protocols: [ProtocolModel]) {
        protocolsDictionary = [:]
        for protocolItem in protocols {
            let protocolKey = String(protocolItem.name.prefix(1).uppercased())
            if var protocolValues = protocolsDictionary[protocolKey] {
                protocolValues.append(protocolItem)
                protocolsDictionary[protocolKey] = protocolValues
            } else {
                protocolsDictionary[protocolKey] = [protocolItem]
            }
        }
        sectionLetters  = protocolsDictionary.keys.sorted()
    }
    
    func calculateDisplayingModel() {
        selectionCalculator(protocols: protocols.filter{ self.filterString == nil ? true : $0.name.uppercased().starts(with: self.filterString!.uppercased())})
        if sectionLetters.count == 1 {
            let key = sectionLetters[0]
            if protocolsDictionary[key]?.count == 1 {
                performSegue(withIdentifier: "showProtocol", sender: protocolsDictionary[key]?[0].url)
            }
        }
    }
    
}

//MARK: - ProtocolsViewController - #1 Extension: Hide keyboard

// One extension implement here
extension ProtocolsViewController {
    func dismissKey() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(ProtocolsViewController.dismissKeyboard))
        tap.cancelsTouchesInView        = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}

//MARK: - UISearchBarDelegate

// UISearchBarDelegate implement here
extension ProtocolsViewController: UISearchBarDelegate {
    
    // run when user choose a letter from keyboard -> searchText changed
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filterString = searchText.isEmpty ? nil : searchText
        calculateDisplayingModel()
        protocolTableView.reloadData()
    }
    
    // When search button was tapped, this fuction run
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        protocolSearchBar.resignFirstResponder()
    }
}

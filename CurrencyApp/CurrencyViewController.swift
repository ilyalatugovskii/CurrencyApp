//
//  CurrencyViewController.swift
//  CurrencyApp
//
//  Created by Ilya Latugovskii on 13.05.2020.
//  Copyright (c) 2020 Ilya Latugovskii. All rights reserved.
//

import UIKit
import BusinessLogic
import UIFramework

class CurrencyViewController: UIViewController {
    
    private let businessLogic = BusinessLogic.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        businessLogic.makeRequestForData {
            IOManager.shared.reloadTableView()
        }
    }
}

extension CurrencyViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return businessLogic.currencies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let currencies = businessLogic.currencies
        return IOManager.shared.getTableViewCell(curName: currencies[indexPath.row].curName , curOfficialRate: currencies[indexPath.row].curOfficialRate)
    }
    
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        businessLogic.swapInCurrencies(sourceIndexPathRow: sourceIndexPath.row, destinationIndexPathRow: destinationIndexPath.row)
    }

}


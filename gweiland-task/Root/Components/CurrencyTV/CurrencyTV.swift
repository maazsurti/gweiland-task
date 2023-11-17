//
//  CurrencyTV.swift
//  gweiland-task
//
//  Created by Maaz on 17/11/23.
//

import Foundation
import UIKit

class CurrencyTV: TableView {
    
    var currencyData = [Cryptocurrency]() {
        didSet {
            self.reloadData()
        }
    }
    
    var logoURLs = [String]() {
        didSet{
            self.reloadData()
        }
    }
    
    override func configure() {
        super.configure()
        
        delegate = self
        dataSource = self
        self.register(CurrencyCell.self, forCellReuseIdentifier: CurrencyCell.identifier)
        
        rowHeight = UITableView.automaticDimension
        sectionHeaderHeight = UITableView.automaticDimension
        separatorColor = .clear
        clipsToBounds = true
        showsVerticalScrollIndicator = false
        translatesAutoresizingMaskIntoConstraints = false

        
        if #available(iOS 15.0, *) {
            sectionHeaderTopPadding = 0
        }
    }
}

extension CurrencyTV: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currencyData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let data = currencyData[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: CurrencyCell.identifier, for: indexPath) as! CurrencyCell
        cell.configure(with: data)
        if !logoURLs.isEmpty {
            cell.currencyImage.contentMode = .scaleAspectFit
            cell.currencyImage.setImageWith(logoURLs[indexPath.row])
        }
        return cell
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let v = CurrencyTVHeader()
        return v
    }
    
    
}

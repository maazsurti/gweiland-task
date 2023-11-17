//
//  CurrencyTV.swift
//  gweiland-task
//
//  Created by Maaz on 17/11/23.
//

import Foundation
import UIKit

class CurrencyTV: TableView {
    
    override func configure() {
        super.configure()
        
        delegate = self
        dataSource = self
        self.register(CurrencyCell.self, forCellReuseIdentifier: CurrencyCell.identifier)
        
        rowHeight = UITableView.automaticDimension
        sectionHeaderHeight = UITableView.automaticDimension
        separatorColor = .clear
        clipsToBounds = true
        bounces = false
        showsVerticalScrollIndicator = false
        translatesAutoresizingMaskIntoConstraints = false

        
        if #available(iOS 15.0, *) {
            sectionHeaderTopPadding = 0
        }
    }
}

extension CurrencyTV: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CurrencyCell.identifier, for: indexPath) as! CurrencyCell
        return cell
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let v = CurrencyTVHeader()
        return v
    }
    
    
}

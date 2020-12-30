//
//  ExTableView.swift
//  AppleMusic
//
//  Created by Sergey on 30.12.2020.
//

import Foundation
import UIKit


extension HistoryViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        history = CoreDataService.shared.fetch()
        return history.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "HistoryTableViewCell", for: indexPath) as! HistoryTableViewCell
        cell.titleLabel.text = history[indexPath.row].searchText
        return cell
    }
    
    
}

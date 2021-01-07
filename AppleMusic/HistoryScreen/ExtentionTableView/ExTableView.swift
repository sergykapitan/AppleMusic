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
        return viewModel.shared().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "HistoryTableViewCell", for: indexPath) as! HistoryTableViewCell
        let text = viewModel.shared()[indexPath.row].searchText
        cell.titleLabel.text = text
        return cell
    }
}

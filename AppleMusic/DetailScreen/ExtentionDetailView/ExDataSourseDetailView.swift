//
//  ExDataSourseDetailView.swift
//  AppleMusic
//
//  Created by Sergey on 27.12.2020.
//

import Foundation
import UIKit

extension DetailViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.reuseIDTable, for: indexPath)
       
        return cell
    }
    
    
}

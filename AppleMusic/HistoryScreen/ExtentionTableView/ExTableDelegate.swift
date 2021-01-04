//
//  ExTableDelegate.swift
//  AppleMusic
//
//  Created by Sergey on 30.12.2020.
//

import Foundation
import UIKit

extension HistoryViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 128
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let navVC = tabBarController?.viewControllers![0] as! UINavigationController
        let cartTableViewController = navVC.topViewController as! SearchCollectionViewController
        let searchText: String = history[indexPath.row].searchText!
        cartTableViewController.makeReguest(searchText: searchText)
        tabBarController?.selectedIndex = 0
 
    }
}

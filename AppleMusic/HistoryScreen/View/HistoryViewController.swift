//
//  SearchViewController.swift
//  AppleMusic
//
//  Created by Sergey on 23.12.2020.
//

import UIKit

class HistoryViewController: UIViewController {
    
  
    let historyView = HistoryViewCode()
    var history = [History]()
    
    //MARK - LifeCicle
    override func loadView() {
        view = historyView
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        makeTableView()
  
    }
    
    private func makeTableView() {
        historyView.tableView.dataSource = self
        historyView.tableView.delegate = self
        historyView.tableView.register(HistoryTableViewCell.self, forCellReuseIdentifier: "HistoryTableViewCell")
    }

}

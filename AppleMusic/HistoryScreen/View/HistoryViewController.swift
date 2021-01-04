//
//  SearchViewController.swift
//  AppleMusic
//
//  Created by Sergey on 23.12.2020.
//

import UIKit

class HistoryViewController: UIViewController {
    
    private var viewModel: HistoryViewModelProtocol!
    let historyView = HistoryViewCode()
    //var history = [CoreTrack]()
        
 

   
    
    //MARK - LifeCicle
    override func loadView() {
        view = historyView
    }
    override func viewDidLoad() {
        viewModel = HistoryViewModel()
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        updateView()
       // makeTableView()
        viewModel.startFetch()
    }
    
    private func makeTableView() {
        historyView.tableView.dataSource = self
        historyView.tableView.delegate = self
        historyView.tableView.register(HistoryTableViewCell.self, forCellReuseIdentifier: "HistoryTableViewCell")
    }
    private func updateView() {
        viewModel.updateViewData = { [weak self] viewData in
            self?.historyView.viewData = viewData
            
        }
    }

}

//
//  HistoryViewCode.swift
//  AppleMusic
//
//  Created by Sergey on 23.12.2020.
//

import UIKit

final class HistoryViewCode: UIView {
    
    
    var viewData: HistoryData = .initial {
        didSet {
            setNeedsLayout()
            tableView.reloadData()
            print("HistoryViewCode = .inishial")
        }
    }
    //MARK: - First layer in TopView
    
    let cardView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 8
        view.layer.borderWidth = 0.8
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true
            return view
        }()
    var tableView: UITableView = {
        let table = UITableView()
        return table
    }()
    override func layoutSubviews() {
        super.layoutSubviews()
        
        switch viewData {
        case .initial:
            print("viewData .inishial")
        case .success(let success):
            print("viewData .success = \(success.historySearch)")
        case .failure(_):
            print("viewData .failure")
        }
    }
    
    //MARK - initial
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        createCardViewLayer()
    
    }
    
    //MARK: - constraint First Layer
    
    func createCardViewLayer() {
        addSubview(cardView)
        cardView.fillSuperview()
        cardView.addSubview(tableView)
        tableView.fillSuperview()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func updateView(viewModel: HistoryData.History) {
        print("updateView in HistoryViewCode")
    }
}


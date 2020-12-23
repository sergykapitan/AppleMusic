//
//  MainViewCode.swift
//  AppleMusic
//
//  Created by Sergey on 23.12.2020.
//

import UIKit
import Foundation

class MainViewCode: UIView {
    
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
    let searchBar: UISearchBar = {
        let  searchBar = UISearchBar()
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        return searchBar
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        createCardViewLayer()
        createSearchBar()
    
    }
    //MARK: - constraint First Layer
    
    func createCardViewLayer() {
        addSubview(cardView)
        cardView.fillSuperview()
            
    }
    //MARK: - constraint First Layer
    
    func createSearchBar() {
        cardView.addSubview(searchBar)
        searchBar.anchor(top: cardView.topAnchor, left: cardView.leftAnchor, right: cardView.rightAnchor, paddingTop: 10, paddingLeft: 10, paddingRight: 10)
       
    }
    
  
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

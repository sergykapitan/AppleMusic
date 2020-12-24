//
//  MainViewCode.swift
//  AppleMusic
//
//  Created by Sergey on 23.12.2020.
//

import UIKit

final class SearchViewCode: UIView {
 
    
    var viewData: ViewData = .initial {
        didSet {
            setNeedsLayout()
        }
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        
        switch viewData {
        
        case .initial:
            update(viewData: nil, isHidden: true)
        case .loading(let loading):
            update(viewData: loading, isHidden: false)
        case .success(let success):
            update(viewData: success, isHidden: false)
        case .failure(let failure):
            update(viewData: failure, isHidden: false)
        }
    }
    
    func update(viewData: ViewData.Data?, isHidden: Bool) {
        
        // cardView.isHidden = !isHidden
        // searchBar.isHidden = !isHidden
        titleLabel.isHidden = isHidden
        
    }
    
    
    //MARK: - First layer in TopView
    
    let cardView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 8
        view.layer.borderWidth = 0.8
        view.backgroundColor = .white
        view.clipsToBounds = true
        return view
    }()
    
    // MARK - Second layer in TopView
    
    let searchBar: UISearchBar = {
        let  searchBar = UISearchBar()
        return searchBar
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .red
        return label
    }()
    
    let searchButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .red
        return button
    }()
   
    //MARK - initial
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        createCardViewLayer()
        createSecondLayer()

    }
    //MARK: - constraint First Layer
    
    func createCardViewLayer() {
        addSubview(cardView)
        cardView.fillSuperview()

    }
    //MARK: - constraint Second Layer
    
    func createSecondLayer() {
        cardView.addSubview(searchBar)
        searchBar.anchor(top: cardView.topAnchor, left: cardView.leftAnchor, right: cardView.rightAnchor, paddingTop: 10, paddingLeft: 10, paddingRight: 10)

        cardView.addSubview(titleLabel)
        titleLabel.anchor(top: searchBar.bottomAnchor,left: cardView.leftAnchor,right: cardView.rightAnchor,paddingTop: 10,paddingLeft: 30,paddingRight: 30,height: 30)
        
        cardView.addSubview(searchButton)
        searchButton.centerX(inView: cardView)
        searchButton.anchor(bottom: cardView.bottomAnchor,paddingBottom: 10,width: 50,height: 50)
        
    
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

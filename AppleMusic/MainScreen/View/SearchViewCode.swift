//
//  MainViewCode.swift
//  AppleMusic
//
//  Created by Sergey on 23.12.2020.
//

import UIKit

final class SearchViewCode: UIView {


    //MARK: - UI
    private let spinner: UIActivityIndicatorView = {
        let spinner = UIActivityIndicatorView(style: .large)
        spinner.color = UIColor.black
        spinner.translatesAutoresizingMaskIntoConstraints = false
        spinner.hidesWhenStopped = true
        return spinner
    }()
    
    lazy var collectionView: UICollectionView = {
        let collectionViewFlowLayout = UICollectionViewFlowLayout()
        collectionViewFlowLayout.scrollDirection = .vertical

        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewFlowLayout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .clear
        collectionView.showsVerticalScrollIndicator = false
        collectionView.register(SearchCollectionViewCell.self, forCellWithReuseIdentifier: Constants.reuseID)
        return collectionView
    }()
    
    // MARK: - Init
    init() {
        super.init(frame: CGRect.zero)
        
        initUI()
        initLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func initUI() {
        backgroundColor = .white
        addSubview(collectionView)
        addSubview(spinner)
    }
    
    private func initLayout() {
        collectionView.fillFull(for: self)
        
        NSLayoutConstraint.activate([
            spinner.centerXAnchor.constraint(equalTo: centerXAnchor),
            spinner.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
    
    //MARK: - Methods
    func showSpinner() {
        spinner.startAnimating()
    }

    private func hideSpinner() {
        spinner.stopAnimating()
    }
    
    func hideSpinner(withDelay delay: TimeInterval) {
        DispatchQueue.main.asyncAfter(deadline: .now() + delay) { [unowned self] in
            self.hideSpinner()
        }
    }
   

}

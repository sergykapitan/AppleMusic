//
//  SearchCollectionViewController.swift
//  AppleMusic
//
//  Created by Sergey on 24.12.2020.
//

import UIKit

class SearchCollectionViewController: UIViewController {

    weak var collectionView: UICollectionView!
    let searchController = UISearchController(searchResultsController: nil)
    var delegateNetworkServise: NetworkingProtocol?
    
    
    override func loadView() {
        super.loadView()

        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(collectionView)
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: self.view.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
        ])
        self.collectionView = collectionView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
 
        setupSearchBar()
        
        delegateNetworkServise = NetworkServise()
        
        self.collectionView.backgroundColor = .white
        self.collectionView.dataSource = self
        self.collectionView.delegate = self

        self.collectionView.register(SearchCollectionViewCell.self, forCellWithReuseIdentifier: Constants.reuseID)
    }
    
    private func setupSearchBar() {
        navigationItem.searchController = searchController
        searchController.searchBar.delegate = self
    }
    
    
    
}

extension SearchCollectionViewController: UICollectionViewDataSource {

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.reuseID, for: indexPath) as! SearchCollectionViewCell
        cell.textLabel.text = String(indexPath.row + 1)
        return cell
    }
}

extension SearchCollectionViewController: UICollectionViewDelegate {

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.row + 1)
    }
}

extension SearchCollectionViewController: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {

        return CGSize(width: collectionView.bounds.size.width - 16, height: 120)
    }
//    func collectionView(_ collectionView: UICollectionView,
//                        layout collectionViewLayout: UICollectionViewLayout,
//                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
//        return 15
//    }
//
//    func collectionView(_ collectionView: UICollectionView,
//                        layout collectionViewLayout: UICollectionViewLayout,
//                        minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
//        return 15
//    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets.init(top: 8, left: 8, bottom: 8, right: 8)
    }
}
extension SearchCollectionViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print(searchText)
        delegateNetworkServise?.request(for: searchText, complation: { [ weak self ](data) in
            let someString = String(data: data , encoding: .utf8)
            print(someString)
        })
    }
}

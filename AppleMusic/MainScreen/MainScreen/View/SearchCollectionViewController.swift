//
//  SearchCollectionViewController.swift
//  AppleMusic
//
//  Created by Sergey on 24.12.2020.
//

import UIKit
import Foundation
import CoreData


class SearchCollectionViewController: UIViewController, UISearchBarDelegate {
    
    
    var history = [CoreTrack]()
    
    var isSearchBarEmpty: Bool {
        navigationItem.searchController = searchController
        return searchController.searchBar.text?.isEmpty ?? true
    }
    
    let searchView = SearchViewCode()
    let viewModel = ViewModel()
    
    
    private let refreshControl = UIRefreshControl()
    private let searchController = UISearchController(searchResultsController: nil)
    
    // MARK: - LifiCicle
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.tabBar.isHidden = false
    }

    override func loadView() {
        super.loadView()
        view = searchView
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setupMainView()
        setupSearchBar()

    }
    
    // MARK: - Metods
    private func setupSearchBar() {
        navigationItem.searchController = searchController
        searchController.searchBar.placeholder = "Enter Albom name here"
        searchController.searchBar.delegate = self
    }
    private func setupMainView() {
        searchView.collectionView.delegate = self
        searchView.collectionView.dataSource = self
        searchView.collectionView.refreshControl = refreshControl
        refreshControl.addTarget(self, action: #selector(refreshAlbumList), for: .valueChanged)
    }
    func makeReguest(searchText: String) {
        searchView.showSpinner()
        viewModel.get(search: searchText)

    }
    func stopSpiners() {
        searchView.hideSpinner(withDelay: 0.2)
        refreshControl.endRefreshing()
    }
    private func showAlert(title: String, message: String) {
        let ac = UIAlertController(title: title, message: message, preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "OK", style: .default))
        present(ac, animated: true)
    }
    private func reloadView() {
            searchView.collectionView.reloadData()
        }

    //MARK: - Selectors
    @objc private func refreshAlbumList() {
        makeReguest(searchText:viewModel.lastRequestName)
       }
}

   //MARK: - UISearchBarDelegate
extension SearchCollectionViewController {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
    guard let searchText = searchBar.text?.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) else { return }
    
        viewModel.get(search: searchText)
        viewModel.save(text: History(searchText: searchText))
     //   CoreManager.shared.save(History(searchText: searchText))
        
        navigationItem.searchController?.isActive = false
        
    }
}

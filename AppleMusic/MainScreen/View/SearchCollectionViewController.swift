//
//  SearchCollectionViewController.swift
//  AppleMusic
//
//  Created by Sergey on 24.12.2020.
//

import UIKit

class SearchCollectionViewController: UIViewController {
    
    //MARK: - Property
  
    let searchView = SearchViewCode()
    var viewModel: MainViewModel
    
    private let refreshControl = UIRefreshControl()
    private let searchController = UISearchController(searchResultsController: nil)
    
    
    init(viewModel: MainViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
    // MARK: - LifiCicle
    override func loadView() {
        super.loadView()
        view = searchView
    
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.delegate = self
        
        
        
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
        viewModel.fetchAlbums(searchText: searchText)

    }
    @objc private func refreshAlbumList() {
        makeReguest(searchText: viewModel.lastRequestName)
    }
    private func stopSpiners() {
        searchView.hideSpinner(withDelay: 0.2)
        refreshControl.endRefreshing()
    }
    private func showAlert(title: String, message: String) {
        let ac = UIAlertController(title: title, message: message, preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "OK", style: .default))
        present(ac, animated: true)
    }
    
}

//MARK: - MainViewModelProtocol

extension SearchCollectionViewController: MainViewModelProtocol {
    
    func fetchingResult(_ isNeedToUpdateView: Bool, errorDescription: String?) {
        guard errorDescription == nil else {
            DispatchQueue.main.async {
                self.showAlert(title: "Request error", message: errorDescription ?? "No message")
                self.stopSpiners()
            }
            return }
        if isNeedToUpdateView {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                self.searchView.collectionView.reloadData()
                self.stopSpiners()
            }
        } else {
            DispatchQueue.main.async {
                self.stopSpiners()
            }
        }
    }
}

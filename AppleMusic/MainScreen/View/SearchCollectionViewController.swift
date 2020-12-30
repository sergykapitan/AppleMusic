//
//  SearchCollectionViewController.swift
//  AppleMusic
//
//  Created by Sergey on 24.12.2020.
//

import UIKit
import CoreData


class SearchCollectionViewController: UIViewController {
    
    var viewDataCell: ViewData = .initial {
        didSet {
            DispatchQueue.main.async {
                self.reloadView()
            }
        }
    }
    
    var name = [NSManagedObject]()
    let searchView = SearchViewCode()
    var viewModel: MainViewModelProtocol!
 
    
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
        viewModel = MainViewModel()
        super.viewDidLoad()
    
        updateView()
        
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
        viewModel.startFetch(searchText: searchText)
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
    
    //MARK: - Selectors
    @objc private func refreshAlbumList() {
        makeReguest(searchText:viewModel.lastRequestName)
       }
    
    private func updateView() {
        viewModel.updateViewData = { [weak self] viewData in
            self?.viewDataCell = viewData
        }
    }
    private func reloadView() {
        searchView.collectionView.reloadData()
    }

}
extension SearchCollectionViewController: TrackMovingDelegate {
    func moveBackForPreviousTrack() -> TrackData.TrackOne? {
        return getTrack(isForward: true)
    }
    
    func moveForwardForPreviousTrack() -> TrackData.TrackOne? {
        return getTrack(isForward: false)
    }
    

    private func getTrack(isForward: Bool) -> TrackData.TrackOne? {
        guard let indexPath = searchView.collectionView.indexPathsForSelectedItems else { return nil}
        let index = indexPath.first!
        searchView.collectionView.deselectItem(at: index, animated: true)
        var nextIndexPath: IndexPath!
        
        if isForward {
            nextIndexPath = IndexPath(row: index.row + 1, section: index.section)
        } else {
            nextIndexPath = IndexPath(row: index.row - 1, section: index.section)
        }
        
        searchView.collectionView.selectItem(at: nextIndexPath, animated: true, scrollPosition: .top)
        var trackOne: TrackData.TrackOne?
        switch viewDataCell {
        case .success(let success):
            let cellModel = success.results[index.row + 1]
            trackOne = reversData(viewData: cellModel)
            return reversData(viewData: cellModel)
        case .initial:
            break
        case .loading(_):
            break
        case .failure(_):
            break
        }
        return trackOne
    }

}

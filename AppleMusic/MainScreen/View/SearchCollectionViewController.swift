//
//  SearchCollectionViewController.swift
//  AppleMusic
//
//  Created by Sergey on 24.12.2020.
//

import UIKit

class SearchCollectionViewController: UIViewController {
    
    //MARK: - Property

    weak var collectionView: UICollectionView!

    
    private let mainView = SearchViewCode()
    private var viewModel: MainViewModel
    private let cache = NSCache<NSNumber, UIImage>()
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
        view = mainView
    
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.delegate = self
        mainView.collectionView.delegate = self
        mainView.collectionView.dataSource = self
        mainView.collectionView.refreshControl = refreshControl
        refreshControl.addTarget(self, action: #selector(refreshAlbumList), for: .valueChanged)
        
        
        
        setupSearchBar()

    }
    
    // MARK: - Metods
    private func setupSearchBar() {
        navigationItem.searchController = searchController
        searchController.searchBar.placeholder = "Enter Albom name here"
        searchController.searchBar.delegate = self
    }
    private func makeReguest(searchText: String) {
        mainView.showSpinner()
        viewModel.fetchAlbums(searchText: searchText)

    }
    @objc private func refreshAlbumList() {
        makeReguest(searchText: viewModel.lastRequestName)
    }
    private func stopSpiners() {
        mainView.hideSpinner(withDelay: 0.2)
        refreshControl.endRefreshing()
    }
    private func showAlert(title: String, message: String) {
        let ac = UIAlertController(title: title, message: message, preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "OK", style: .default))
        present(ac, animated: true)
    }
    
}

extension SearchCollectionViewController: UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.model.results.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.reuseID, for: indexPath) as? SearchCollectionViewCell else { return SearchCollectionViewCell()}
        let itemNumber = NSNumber(value: indexPath.item)
        print(itemNumber)
        if let cachedImage = self.cache.object(forKey: itemNumber) {
            // cell.configureCell(albumName: cachedImage)
        } else {
            cell.showSpinner()
            let model = viewModel.model.results[indexPath.row]
            DispatchQueue.main.async {
                cell.configureCell(albumName: model.artistName ?? self.viewModel.lastRequestName)
            }
            cell.hideSpinner(withDelay: 1)
        }
    

        return cell
    }
}

extension SearchCollectionViewController: UICollectionViewDelegate {

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.row + 1)
    }
}

extension SearchCollectionViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return UIScreen.main.bounds.width * 0.1
    }
    

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {

        return CGSize(width: UIScreen.main.bounds.width * 0.35,
                      height: UIScreen.main.bounds.width * 0.35)
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: UIScreen.main.bounds.width * 0.1,
                            bottom: 0, right: UIScreen.main.bounds.width * 0.1)
    }
}
extension SearchCollectionViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        mainView.showSpinner()
        makeReguest(searchText: searchText)
        mainView.hideSpinner(withDelay: 1)
      //  navigationItem.searchController?.isActive = false
 
       }
}
//MARK: - MainViewModelProtocol
extension SearchCollectionViewController: MainViewModelProtocol {
    func fetchingResult(_ isNeedToUpdateView: Bool, errorDescription: String?) {
        guard errorDescription == nil else {
            print(errorDescription!)
            DispatchQueue.main.async {
                self.showAlert(title: "Request error", message: errorDescription ?? "No message")
                self.stopSpiners()
            }
            return }
        if isNeedToUpdateView {
            cache.removeAllObjects()
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                self.mainView.collectionView.reloadData()
                self.stopSpiners()
            }
        } else {
            DispatchQueue.main.async {
                self.stopSpiners()
            }
        }
    }
}

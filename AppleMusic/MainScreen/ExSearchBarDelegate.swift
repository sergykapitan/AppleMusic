//
//  ExSearchBarDelegate.swift
//  AppleMusic
//
//  Created by Sergey on 27.12.2020.
//

import UIKit

extension SearchCollectionViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchView.showSpinner()
        makeReguest(searchText: searchText)
    }

    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchView.showSpinner()
        makeReguest(searchText: searchBar.text?.replacingOccurrences(of: " ", with: "") ?? "Cach")
        navigationItem.searchController?.isActive = false
    }
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = ""
        searchBar.endEditing(true)
    }
}

//
//  ExSearchBarDelegate.swift
//  AppleMusic
//
//  Created by Sergey on 27.12.2020.
//

import UIKit

extension SearchCollectionViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false, block: { (_) in
            
            
           
            self.mainView.showSpinner()
            self.makeReguest(searchText: searchText)
            self.mainView.hideSpinner(withDelay: 1)
        })
    }
}

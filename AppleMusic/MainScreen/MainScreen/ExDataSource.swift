//
//  ExDataSource.swift
//  AppleMusic
//
//  Created by Sergey on 27.12.2020.
//

import UIKit


extension SearchCollectionViewController: UICollectionViewDataSource {
    

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return viewModel.albums.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.reuseID, for: indexPath) as? SearchCollectionViewCell else { return SearchCollectionViewCell()}
        let album = viewModel.albums[indexPath.row]        
        cell.album = album
        stopSpiners()
        return cell
    }
}

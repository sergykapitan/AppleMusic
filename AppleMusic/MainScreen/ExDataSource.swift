//
//  ExDataSource.swift
//  AppleMusic
//
//  Created by Sergey on 27.12.2020.
//

import UIKit


extension SearchCollectionViewController: UICollectionViewDataSource {
    

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        var sec = 0
        switch  viewDataCell {
        case .initial:
            print("numberOfItemsInSection .initial")
        case .loading(let loading):
            sec = loading.results.count
        case .success( let success):
            sec = success.results.count
        case .failure(_):
            print("failure")
        }
        return sec
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.reuseID, for: indexPath) as? SearchCollectionViewCell else { return SearchCollectionViewCell()}
        switch viewDataCell {
        case .initial:
            print("cell = .initial")
        case .loading(let loading):
            cell.showSpinner()
        case .success( let success):
            cell.hideSpinner(withDelay: 0.5)
            let model = success.results[indexPath.row]
            guard let url = URL(string: model.artworkUrl100 ?? "") else { return cell }
            cell.configureCell(albumName: model.collectionName ?? "", url: url, artistName: model.artistName ?? "")
            cell.hideSpinner(withDelay: 1)
            stopSpiners()
            return cell
        case .failure(_):
            break
        }
        return cell
    }
}

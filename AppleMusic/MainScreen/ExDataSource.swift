//
//  ExDataSource.swift
//  AppleMusic
//
//  Created by Sergey on 27.12.2020.
//

import UIKit


extension SearchCollectionViewController: UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.model.results.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.reuseID, for: indexPath) as? SearchCollectionViewCell else { return SearchCollectionViewCell()}
        cell.showSpinner()
        let model = viewModel.model.results.sorted(by: {$0.artistName! < $1.artistName!})[indexPath.row]
        guard let url = URL(string: model.artworkUrl100 ?? "") else { return cell }
        cell.configureCell(albumName: model.collectionName ?? self.viewModel.lastRequestName, url: url, artistName: model.artistName ?? "")
        cell.hideSpinner(withDelay: 0.5)
        return cell
    }
}

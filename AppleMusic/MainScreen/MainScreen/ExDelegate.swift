//
//  ExDelegate.swift
//  AppleMusic
//
//  Created by Sergey on 27.12.2020.
//

import UIKit

extension SearchCollectionViewController: UICollectionViewDelegate {

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
            
        let album = viewModel.albums[indexPath.row]
        viewModel.currentAlbum = album
        goToDetail(with: viewModel)
                
     }
}

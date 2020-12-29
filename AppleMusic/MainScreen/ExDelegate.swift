//
//  ExDelegate.swift
//  AppleMusic
//
//  Created by Sergey on 27.12.2020.
//

import UIKit

extension SearchCollectionViewController: UICollectionViewDelegate {

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.row + 1)
            switch viewDataCell {
            case .success(let success):
                let cells = success.results[indexPath.row]
                let detailVC = DetailViewController()
                detailVC.fetchD(detailModel: cells)
                detailVC.delegate = self
                navigationController?.pushViewController(detailVC, animated: true)
            case .initial:
                break
            case .loading(_):
                break
            case .failure(_):
                break
            }

    }
}

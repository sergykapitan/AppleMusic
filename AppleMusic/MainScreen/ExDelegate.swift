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
        if let cell = collectionView.cellForItem(at: indexPath) as? SearchCollectionViewCell {
            
                let cells = viewModel.model.results[indexPath.row]
                let detailVM = DetailViewModel(model: cells)
                let detail = DetailViewController(viewModel: detailVM)
                            
            navigationController?.pushViewController(detail, animated: true)

            
            
        } else {
            
        }

    }
}

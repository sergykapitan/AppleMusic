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
            
            private var searchViewModel = SearchViewModel.init(cells: [])
            var detailModell: ViewData = ViewData
            //let cellViewModel = detailModell.cells[indexPath.row]

            let detailModel = DetailViewModel(model: viewModel.model)
            print("detailModel = \(cellViewModel)" )
            let detail = DetailViewController(viewModel: detailModel)
            
            navigationController?.pushViewController(detail, animated: true)
            
        } else {
            
        }

    }
}

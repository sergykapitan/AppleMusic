//
//  ExDelegateFlowLayOut.swift
//  AppleMusic
//
//  Created by Sergey on 27.12.2020.
//

import UIKit

extension SearchCollectionViewController: UICollectionViewDelegateFlowLayout {
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
//        return UIScreen.main.bounds.width * 0.1
//    }
    

//    func collectionView(_ collectionView: UICollectionView,
//                        layout collectionViewLayout: UICollectionViewLayout,
//                        sizeForItemAt indexPath: IndexPath) -> CGSize {
//
//        return CGSize(width: UIScreen.main.bounds.width,
//                      height: UIScreen.main.bounds.width * 0.35)
//    }
//
//    func collectionView(_ collectionView: UICollectionView,
//                        layout collectionViewLayout: UICollectionViewLayout,
//                        insetForSectionAt section: Int) -> UIEdgeInsets {
//        return UIEdgeInsets(top: 5, left: 5,
//                            bottom: 5, right: 5)
//    }
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
      
      var height: CGFloat = UIScreen.main.bounds.width * 0.35
//        if let isEmpty = viewModel.model.results.isEmpty, isEmpty {
//        height = 50
//      }
      return CGSize(width: collectionView.bounds.width * 0.95, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        referenceSizeForHeaderInSection section: Int) -> CGSize {
      
//      if isSearchBarEmpty && !history.isEmpty {
//        return CGSize(width: collectionView.frame.width, height: 50.0)
//      }
      return CGSize.zero
    }
}

//
//  PresenterProtocol.swift
//  AppleMusic
//
//  Created by Sergey on 03.01.2021.
//

import Foundation
import UIKit

protocol PresenterProtocol: class {
  var view: ViewProtocol? { get }
  init(view: ViewProtocol)
  func getAlbums(_ searchText: String, completion: @escaping ([Album]) -> Void)
  func setupCollectionView()
  func historyCellTapped(cell: UICollectionViewCell, text: String)
}

//
//  ViewProtocol.swift
//  AppleMusic
//
//  Created by Sergey on 03.01.2021.
//

import Foundation
import UIKit

protocol ViewProtocol: class {
  var presenter: PresenterProtocol? { get }
  var seachBar: UISearchController { get }
}

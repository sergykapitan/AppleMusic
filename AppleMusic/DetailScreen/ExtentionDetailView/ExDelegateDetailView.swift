//
//  ExDelegateDetailView.swift
//  AppleMusic
//
//  Created by Sergey on 27.12.2020.
//

import Foundation
import UIKit

extension DetailViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        tableView.deselectRow(at: indexPath, animated: true)
        print("Selected row: " + String(indexPath.row))
    }
}

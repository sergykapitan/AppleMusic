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
       // return UITableView.automaticDimension
        return 25
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        let cell = viewModel.tracks[indexPath.row]
        detailView.track = cell
    }
}

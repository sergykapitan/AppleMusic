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
        let cell = viewModel.tracks
        tableView.deselectRow(at: indexPath, animated: true)
        let string600 = cell[indexPath.row].image.replacingOccurrences(of: "100x100", with: "600x600")
        guard let url = URL(string: string600) else { return }
        detailView.butttonNextTrack.tag = indexPath.row
        detailView.butttonNextTrack.addTarget(self, action: #selector(nextTrack(sender:)), for: .touchUpInside)
        detailView.configureDetailView(trackTitle:cell[indexPath.row].name! , url: url, previewUrl: cell[indexPath.row].url!)
    }
}

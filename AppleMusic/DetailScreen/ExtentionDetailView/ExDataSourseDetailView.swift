//
//  ExDataSourseDetailView.swift
//  AppleMusic
//
//  Created by Sergey on 27.12.2020.
//

import Foundation
import UIKit

extension DetailViewController: UITableViewDataSource {
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return section == 0 ? 1 : viewModel.tracks.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: DetailTableViewCell.identifier, for: indexPath) as! DetailTableViewCell 
            let album = viewModel.currentAlbum
            cell.album = album
            return cell
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: TrackTableViewCell.identifier, for: indexPath) as! TrackTableViewCell
            let track = viewModel.tracks[indexPath.row]
            cell.track = track
            detailView.track = track
            return cell
        }
       
    }
    
    
}

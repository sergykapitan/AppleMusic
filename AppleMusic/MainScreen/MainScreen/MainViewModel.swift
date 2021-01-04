//
//  MainViewModel.swift
//  AppleMusic
//
//  Created by Sergey on 23.12.2020.
//

import Foundation
protocol TrackDelegate: class {
    func update()
}

protocol PlaylistDelegate: class {
    func update()
}



class ViewModel {
    
    /*ViewModel - main goal is to only allow the view controller to worry about the views
     1. Data
     2. Service Calls
     3. Business Logic
     4. Data Binding - connecting a view to a data source - Property Observer & Communication Pattern
    */
    
    weak var delegate: TrackDelegate?
    weak var playlistDelegate: PlaylistDelegate?
    
    var albums = [Album]() {
        didSet {
            let userInfo: [String:ViewModel] = ["ViewModel":self]
            NotificationCenter.default.post(name: Notification.Name.AlbumNotification, object: nil, userInfo: userInfo)
        }
    }
    var lastRequestName : String = "lil+wayne"
    
    var track: Track!
    
    var playlist = [Track]() {
        didSet {
            playlistDelegate?.update()
        }
    }
    
//    func isInPlaylist(track: Track) -> Bool {
//        let id = track.id
//        for track in CoreManager.shared.load() {
//            if (track.id == id) {
//                return true
//            }
//        }
//        return false
//    }
    
//    func add(track: Track) {
//        CoreManager.shared.save(track)
//    }
    
    func delete(track: Track) {
        CoreManager.shared.delete(track)
    }
    
//    func getPlaylist() {
//        playlist = CoreManager.shared.load()
//    }
    
    var tracks = [Track]() {
        didSet {
            delegate?.update()
        }
    }
    

    
    var currentAlbum: Album! {
        didSet {
            ItunesService.shared.getTracks(for: currentAlbum) { [unowned self] trks in
                self.tracks = trks
            }
        }
    }
    
    func get(search: String) {
        
        ItunesService.shared.getAlbums(for: search) { [weak self] albms in
            self?.albums = albms
            print("Album Count: \(albms.count)")
        }
        
    }   
    
}

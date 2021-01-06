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

class ViewModel {
    
    /*ViewModel - основная цель позволить Controller беспокоиться о View
     1. Data
     2. Service Calls
     3. Business Logic
     4. Data Binding - подключение View к источнику данных - Property Observer & Communication Pattern
    */
    
    weak var delegate: TrackDelegate?
    
    var albums = [Album]() {
        didSet {
            let userInfo: [String:ViewModel] = ["ViewModel":self]
            NotificationCenter.default.post(name: Notification.Name.AlbumNotification, object: nil, userInfo: userInfo)
        }
    }
    var lastRequestName : String = "lil+wayne"
    
    var track: Track!
        
    func delete(track: Track) {
        CoreManager.shared.delete(track)
    }
    
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
        }
        
    }   
    
}

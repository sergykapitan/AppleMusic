//
//  DetailModel.swift
//  AppleMusic
//
//  Created by Sergey on 29.12.2020.
//

import Foundation

enum TrackData {
    
    case initial
    case loading(TrackOne)
    case success(TrackOne)
    case failure(TrackOne)
    
        struct TrackOne {
    
        var trackName: String
        let artistName: String?
        let collectionName: String?
        let artworkUrl100: String?
        var previewUrl: String?
        
     }
}

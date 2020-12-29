//
//  ViewData.swift
//  AppleMusic
//
//  Created by Sergey on 23.12.2020.
//

import Foundation

struct ViewData: Codable {
    
//    case initial
//    case loading
//    case success
//    case failure
    
    var resultCount: Int?
    var results: [TrackData] = [TrackData]()
    
    
    
}

struct TrackData: Codable, Equatable {
    
    var trackName: String
    let artistName: String?
    let collectionName: String?
    let artworkUrl100: String?
    var previewUrl: String?
    
}


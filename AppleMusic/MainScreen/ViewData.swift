//
//  ViewData.swift
//  AppleMusic
//
//  Created by Sergey on 23.12.2020.
//

import Foundation

struct ViewData: Codable {
    
    var resultCount: Int?
    var results: [Data] = [Data]()
    let cells: [Data]
}

struct Data: Codable, Equatable {
    
    var trackName: String
    let artistName: String?
    let collectionName: String?
    let artworkUrl100: String?
    var previewUrl: String?
    
}


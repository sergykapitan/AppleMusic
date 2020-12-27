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
    
}

struct Data: Codable, Equatable {
    
    let artistName: String?
    let collectionName: String?
    let artworkUrl60: String?
    let artworkUrl100: String?
    
}


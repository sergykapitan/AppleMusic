//
//  ViewData.swift
//  AppleMusic
//
//  Created by Sergey on 23.12.2020.
//

import Foundation

enum ViewData {
    
    case initial
    case loading(Data)
    case success(Data)
    case failure(Data)
    
    struct  Data: Codable {
        var resultCount: Int?
        var results = [Track]()
    }
    struct Track: Codable, Equatable {
            var trackName: String
            let artistName: String?
            let collectionName: String?
            let artworkUrl100: String?
            var previewUrl: String?
            
    }
    
}

enum ViewDataMy {
    case initial
    case loading(Data)
    case success(Data)
    case failure(Data)
    
    struct  Data: Codable {
        var resultCount: Int?
        var results = [Track]()
        
        struct Track: Codable, Equatable {
                var trackName: String
                let artistName: String?
                let collectionName: String?
                let artworkUrl100: String?
                var previewUrl: String?
                
            }

    }
    
    
}


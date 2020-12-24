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
    
    
    struct SearchResponce: Decodable {
        var resultCount: Int?
        var results: [Data]
    }
    
    struct Data: Decodable {
        let artistName: String?
        let collectionName: String?
        let artworkUrl60: String?
    }
}

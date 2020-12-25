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
    
}

    
//    static func == (lhs: Photo, rhs: Photo) -> Bool {
//        return lhs.farm == rhs.farm && lhs.secret == rhs.secret && lhs.server == rhs.server && lhs.id == rhs.id
//    }



//    struct ViewData: Codable {
//        var resultCount: Int?
//        var results: [Data]
//    }
//
//    struct Data: Codable {
//        let artistName: String?
//        let collectionName: String?
//        let artworkUrl60: String?
//    }


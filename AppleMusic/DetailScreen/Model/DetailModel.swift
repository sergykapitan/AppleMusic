//
//  DetailModel.swift
//  AppleMusic
//
//  Created by Sergey on 28.12.2020.
//

import Foundation


struct DetailModel {
    
    struct Cell {
        
        var iconUrlString: String?
        var trackName: String
        var collectionName: String
        var artistName: String
        var previewUrl: String?
        
    }
    
    let cells: [Cell]
}

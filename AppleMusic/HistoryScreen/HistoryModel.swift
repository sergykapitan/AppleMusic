//
//  HistoryModel.swift
//  AppleMusic
//
//  Created by Sergey on 30.12.2020.
//

import Foundation


enum HistoryData {
    
    case initial
    case success(History)
    case failure(History)
    
    struct History {
        
        let historySearch: String?
        
    }
   
}

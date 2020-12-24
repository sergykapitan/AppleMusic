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
    
    struct Data {
        
        let icon: String?
        let title: String?
        let description: String?
    }
}

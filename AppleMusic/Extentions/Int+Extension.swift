//
//  Int+Extension.swift
//  AppleMusic
//
//  Created by Sergey on 03.01.2021.
//

import Foundation

extension Int {
    
    
    var toMinutes: String? {
        
        let totalSeconds = self / 1000
        
        var minutes: Double
        var seconds: Int
        
        minutes = Double(totalSeconds / 60)
        minutes.round(.down)
        
        seconds = Int(totalSeconds) % 60
        
        return "\(Int(minutes)) min \(seconds) sec"
        
    }
    
}

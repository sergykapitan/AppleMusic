//
//  CMTime + Extention.swift
//  AppleMusic
//
//  Created by Sergey on 29.12.2020.
//

import Foundation
import AVKit

extension CMTime {
    
    func toDisplayString() -> String {
        guard !CMTimeGetSeconds(self).isNaN else { return ""}
        let totalSecond = Int(CMTimeGetSeconds(self))
        let seconds = totalSecond % 60
        let minute = totalSecond / 60
        let timeFormateString = String(format: "%02d:%02d",minute, seconds)
        return timeFormateString
    }
}

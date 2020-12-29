//
//  DetailViewModel.swift
//  AppleMusic
//
//  Created by Sergey on 28.12.2020.
//

import Foundation
import AVKit

protocol DetailViewModelProtocol: class {
    func setUI(detailModel: TrackData)
}

final class DetailViewModel {
        
    var detailModel: TrackData
    weak var delegate: DetailViewModelProtocol?
    
    
    init(model: TrackData) {
        self.detailModel = model
    }

    
    func fetchTrack() {
        self.delegate?.setUI(detailModel: detailModel)
    }
   
}

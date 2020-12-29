//
//  DetailViewModel.swift
//  AppleMusic
//
//  Created by Sergey on 28.12.2020.
//

import Foundation
import AVKit


protocol DetailViewModelProtocol {
    
    var updateViewData:((TrackData) ->())? { get set }
}

final class DetailViewModel: DetailViewModelProtocol{
    
    
    var updateViewData: ((TrackData) -> ())?
    var detailModel: ViewData.Track {
        didSet{
            print("detailModel= \(detailModel)")
        }
        willSet {
            print("detailModel= \(detailModel)")
        }
    }

    init(detailModel: ViewData.Track) {
        
        self.detailModel = detailModel
        updateViewData?(.initial)
    }
  
   
    func getData(detailModel:ViewData.Track) {
        self.detailModel = detailModel
    }
 
    func fetchTrack() {
        self.updateViewData?(.success(reversData(viewData: self.detailModel)))
    }
    
    func reversData(viewData:ViewData.Track) -> TrackData.TrackOne {
        return TrackData.TrackOne(trackName: viewData.trackName,
                                  artistName: viewData.artistName,
                                  collectionName: viewData.collectionName,
                                  artworkUrl100: viewData.artworkUrl100,
                                  previewUrl: viewData.previewUrl)
    }
   
}

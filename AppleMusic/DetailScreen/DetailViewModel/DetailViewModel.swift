//
//  DetailViewModel.swift
//  AppleMusic
//
//  Created by Sergey on 28.12.2020.
//

import Foundation
import AVKit

protocol DetailViewModelProtocol: class {
    func fetchingResult(_ isNeedToUpdateView: Bool, errorDescription: String?)
}

final class DetailViewModel {
    
    private let utilityQueue = DispatchQueue.global(qos: .utility)
    
    var model: ViewData = ViewData()
    var detailModel: DetailModel = DetailModel(cells: [])
    
    weak var delegate: DetailViewModelProtocol?
   
  
    init(model: ViewData ) {
        self.model = model
        
    }
    
    func fetchTrack() {
         print("DetailViewModel")
        self.delegate?.fetchingResult(true, errorDescription: nil)
               
    }
}

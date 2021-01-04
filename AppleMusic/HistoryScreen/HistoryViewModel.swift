//
//  HistoryViewModel.swift
//  AppleMusic
//
//  Created by Sergey on 30.12.2020.
//

import Foundation

protocol HistoryViewModelProtocol {
    var updateViewData:((HistoryData) ->())? { get set }
    func startFetch()
}

final class HistoryViewModel: HistoryViewModelProtocol {
    var updateViewData: ((HistoryData) -> ())?
    
    var history = [CoreTrack]()
    
    init() {
        updateViewData?(.initial)
    }
    
  //  print(UsserSettings.userName)
    
    func startFetch() {
        updateViewData?(.initial)
        updateViewData?(.success(HistoryData.History(historySearch: "111")))
       // history = CoreDataService.shared.fetch()
        print(history.count)
    }
    
   
}


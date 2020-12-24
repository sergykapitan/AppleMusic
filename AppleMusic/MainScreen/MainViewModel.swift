//
//  MainViewModel.swift
//  AppleMusic
//
//  Created by Sergey on 23.12.2020.
//

import Foundation

protocol MainViewModelProtocol {
    var updateViewData: ((ViewData) -> ())? { get set }
    func startFetch()
}

final class MainViewModel: MainViewModelProtocol {
    
    public var updateViewData: ((ViewData) -> ())?
    
    init() {
        updateViewData?(.initial)
    }
 
    func startFetch() {
        // start loading
        updateViewData?(.loading(ViewData.Data(artistName: "",
                                               collectionName: "",
                                               artworkUrl60: "")))
            print("start loading")
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) { [ weak self] in
            self?.updateViewData?(.success(ViewData.Data(artistName: "",
                                                         collectionName: "",
                                                         artworkUrl60: "")))
            print("start succes")
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) { [ weak self] in
            self?.updateViewData?(.failure(ViewData.Data(artistName: "fail",
                                                         collectionName: "fail",
                                                         artworkUrl60: "fail")))
            print("start failure")
        }
    }
    
    
}

//
//  MainViewModel.swift
//  AppleMusic
//
//  Created by Sergey on 23.12.2020.
//

import Foundation

protocol MainViewModelProtocol {
    
    var updateViewData:((ViewData) ->())? { get set }
    func startFetch(searchText: String)
    var lastRequestName: String { get set}
}

final class MainViewModel: MainViewModelProtocol {
    
    var updateViewData: ((ViewData) -> ())?
    var delegateNetServece: NetworkingProtocol?
    
    var lastRequestName = "Johnny"
    
    init() {
        updateViewData?(.initial)
    }
    
    
    func startFetch(searchText: String) {
        
        delegateNetServece = NetworkServise()
        delegateNetServece?.request(for: searchText, completion: { (result) in
            switch result {
            case .success(let data):
                self.lastRequestName = searchText
                self.updateViewData?(.success(data))
            case .failure(let error):
                print(error.localizedDescription)
            }
        })
  
    }
}

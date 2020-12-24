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
        updateViewData?(.loading(ViewData.Data(icon: "",
                                               title: "",
                                               description: "")))
            print("start loading")
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) { [ weak self] in
            self?.updateViewData?(.success(ViewData.Data(icon: "succes",
                                                         title: "good",
                                                         description: "Very Good")))
            print("start succes")
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) { [ weak self] in
            self?.updateViewData?(.failure(ViewData.Data(icon: "failure",
                                                         title: "nogood",
                                                         description: "Bad Good")))
            print("start failure")
        }
    }
    
    
}

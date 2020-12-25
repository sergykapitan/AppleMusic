//
//  MainViewModel.swift
//  AppleMusic
//
//  Created by Sergey on 23.12.2020.
//

import Foundation

protocol MainViewModelProtocol: class {
    func fetchingResult(_ isNeedToUpdateView: Bool, errorDescription: String?)
}

final class MainViewModel {
    
    private let utilityQueue = DispatchQueue.global(qos: .utility)
    
    var model: ViewData = ViewData()
    weak var delegate: MainViewModelProtocol?
    var delegateNetworkServise: NetworkingProtocol?
   
    var lastRequestName: String = "johnny cash"
  
    init(model: ViewData) {
        self.model = model
    }
    
    func fetchAlbums(searchText: String) {
        lastRequestName = searchText
        delegateNetworkServise = NetworkServise()
        delegateNetworkServise?.request(for: searchText, completion: { (result) in
        switch result {
            case .success(let data):
                if self.model.results != data.results {
                    self.model = data
                    self.delegate?.fetchingResult(true, errorDescription: nil)
                } else {
                    self.delegate?.fetchingResult(false, errorDescription: nil )
                }
            case .failure(let data2):
                
                print(data2.localizedDescription)
                self.delegate?.fetchingResult(true, errorDescription: nil)
            }
        })
 
    }
    
//    func loadImage(farm_id: String, server_id: String, id: String, secret: String, completion: @escaping (Data?) -> ()) {
//        utilityQueue.async {
//            guard let url = URL(string: "https://farm\(farm_id).staticflickr.com/\(server_id)/\(id)_\(secret).jpg") else {
//                //https://farm{farm-id}.staticflickr.com/{server-id}/{id}_{secret}.jpg
//                completion(nil)
//                return
//            }
//            
//            guard let data = try? Data(contentsOf: url) else { return }
//            completion(data)
//        }
//    }
//    
}

//
//  Networking.swift
//  AppleMusic
//
//  Created by Sergey on 24.12.2020.
//

import Foundation
import UIKit

//Result<PhotoModel, Error>

protocol NetworkingProtocol {
    func request(for searchText: String, completion:  @escaping (Result<ViewData,Error>) -> ())
}


class NetworkServise: NetworkingProtocol {
 
    func request(for searchText: String, completion: @escaping(Result<ViewData,Error>)->()) {
        
        let session = URLSession.shared
        let url = self.url(from: searchText)
        print(url)
        let task = session.dataTask(with: url) { data, response, error in
            
            guard  error == nil  else {
               // print("Error recived requesting data: \(error.localizedDescription)")
                completion(.failure(error!))
                return
            }
            guard let data = data else { return }
            
            let decoder = JSONDecoder()
            
            do {
                let object = try decoder.decode(ViewData.self, from: data)
                completion(.success(object))
                print("object",object)
            } catch let jsonError {
                completion(.failure(jsonError))
                print("Failed to Decode JSON", jsonError.localizedDescription)
            }
            
            
            
            
            
//            if let data = data,error == nil {
//
//               // let object:SearhModel = try! JSONDecoder().decode(SearhModel.self, from: data)
//
//                    DispatchQueue.main.async {
//                        print(object)
//                        completion(object)
//                }
//            }


        }

            
//            guard error == nil else { completion(.failure(error!))
//                return }
//
//            do {
//                guard let userData = data else { return }
//                let data = try JSONDecoder().decode(SearhModel.self, from: userData)
//                print(data)
//                completion(.success(data))
//            } catch {
//                completion(.failure(error))
//            }
//
//
//        }

        task.resume()
        
    }
    
    private func url(from searchText: String) -> URL {
        
        var components = URLComponents()

        components.scheme = Constants.scheme
        components.host = Constants.host
        components.path = Constants.path
        components.queryItems = [
            URLQueryItem(name: "term", value: searchText),
            URLQueryItem(name: "limit", value: "20")
        ]
        return components.url!
    }

//    private func parseQuote(from data: Data) -> SearhModel {
//
//        let product: SearhModel = try! JSONDecoder().decode(SearhModel.self, from: data)
//                return product
//    }
//
    
}

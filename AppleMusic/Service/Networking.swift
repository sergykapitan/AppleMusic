//
//  Networking.swift
//  AppleMusic
//
//  Created by Sergey on 24.12.2020.
//

import Foundation


protocol NetworkingProtocol: class {
    func request(for searchText: String, completion:  @escaping (Result<ViewData,Error>) -> ())
}


class NetworkServise: NetworkingProtocol {
 
    func request(for searchText: String, completion: @escaping(Result<ViewData,Error>)->()) {
        
        let session = URLSession.shared
        let url = self.url(from: searchText)
        let task = session.dataTask(with: url) { data, response, error in
            
            guard  error == nil  else {
                completion(.failure(error!))
                return
            }
            guard let data = data else { return }
          //  let someS = String(data: data, encoding: .utf8)
            let decoder = JSONDecoder()
            do {
                let object = try decoder.decode(ViewData.self, from: data)
                completion(.success(object))
            } catch let jsonError {
                completion(.failure(jsonError))
                print("Failed to Decode JSON", jsonError.localizedDescription)
            }
        }
        task.resume()
    }
    
    private func url(from searchText: String) -> URL {
        
        var components = URLComponents()

        components.scheme = Constants.scheme
        components.host = Constants.host
        components.path = Constants.path
        components.queryItems = [
            URLQueryItem(name: "term", value: searchText),
            URLQueryItem(name: "limit", value: "50"),
            URLQueryItem(name: "media", value: "music")
           // URLQueryItem(name: "entity", value: "album")
        ]
        return components.url!
    }
}
//"media":"music"]

//
//  Networking.swift
//  AppleMusic
//
//  Created by Sergey on 24.12.2020.
//

import Foundation



protocol NetworkingProtocol {
    func request(for searchText: String, complation:  @escaping (Data) -> ())
}


class NetworkServise: NetworkingProtocol {
 
    func request(for searchText: String, complation: @escaping(Data)->()) {
        
        let session = URLSession.shared
        let url = self.url(from: searchText)
        let task = session.dataTask(with: url) { data, response, error in
            if let data = data,error == nil {
                    DispatchQueue.main.async {
                        complation(data)
                }
            }

            if error != nil || data == nil {
                print("Client error!")
                return
            }

            guard let response = response as? HTTPURLResponse, (200...299).contains(response.statusCode) else {
                print("Server error!")
                return
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
        ]
        return components.url!
    }

}

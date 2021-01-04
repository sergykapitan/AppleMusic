//
//  Artist.swift
//  AppleMusic
//
//  Created by Sergey on 03.01.2021.
//

import Foundation

struct Artist: Decodable {
  let albums: [Album]
  enum CodingKeys:String, CodingKey {
    case albums = "results"
  }
  
  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    albums = try container.decode([Album].self, forKey: .albums)
  }
}

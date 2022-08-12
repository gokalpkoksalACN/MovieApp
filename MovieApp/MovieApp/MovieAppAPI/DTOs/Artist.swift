//
//  Artist.swift
//  MovieApp
//
//  Created by gokalp.koksal on 12.08.2022.
//

import Foundation

struct Artist: Decodable {
    
    enum ArtistCodingKeys: String, CodingKey {
        case name
        case imagePath = "profile_path"
    }
    
    let name: String
    let imagePath: String
    
    init(name: String, imagePath: String) {
        self.name = name
        self.imagePath = imagePath
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: ArtistCodingKeys.self)
        self.name = try container.decode(String.self, forKey: .name)
        let path = try container.decode(String.self, forKey: .imagePath)
        self.imagePath = "https://image.tmdb.org/t/p/w500/" + path
    }
}

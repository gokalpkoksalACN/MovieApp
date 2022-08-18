//
//  Movie.swift
//  MovieApp
//
//  Created by gokalp.koksal on 18.08.2022.
//

import Foundation

struct Movie: Decodable {
    
    enum MovieCodingKeys: String, CodingKey {
        case title
        case imagePath = "poster_path"
    }
    
    let title: String
    let imagePath: String
    
    init(title: String, imagePath: String) {
        self.title = title
        self.imagePath = imagePath
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: MovieCodingKeys.self)
        self.title = try container.decode(String.self, forKey: .title)
        let path = try container.decode(String.self, forKey: .imagePath)
        self.imagePath = "https://image.tmdb.org/t/p/w500/" + path
    }
}

//
//  GenreResponse.swift
//  MovieApp
//
//  Created by gokalp.koksal on 11.08.2022.
//

import Foundation

struct GenreResponse: Decodable {
    
    enum GenreResponseCodingKeys: String, CodingKey {
        case genres
    }
    
    let genres: [Genre]
    
    init(genres: [Genre]) {
        self.genres = genres
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: GenreResponseCodingKeys.self)
        let genres = try container.decode([Genre].self, forKey: .genres)
        self.genres = genres
    }
}

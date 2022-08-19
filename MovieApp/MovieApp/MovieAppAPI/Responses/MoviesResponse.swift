//
//  PopularMoviesResponse.swift
//  MovieApp
//
//  Created by gokalp.koksal on 18.08.2022.
//

import Foundation

struct MoviesResponse: Decodable {
    
    enum MoviesCodingKeys: String, CodingKey {
        case movies = "results"
    }
    
    let movies: [Movie]
    
    init(movies: [Movie]) {
        self.movies = movies
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: MoviesCodingKeys.self)
        self.movies = try container.decode([Movie].self, forKey: .movies)
    }
}

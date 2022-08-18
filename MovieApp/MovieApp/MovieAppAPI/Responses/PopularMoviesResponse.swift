//
//  PopularMoviesResponse.swift
//  MovieApp
//
//  Created by gokalp.koksal on 18.08.2022.
//

import Foundation

struct PopularMoviesResponse: Decodable {
    
    enum PopularMoviesCodingKeys: String, CodingKey {
        case movies = "results"
    }
    
    let movies: [Movie]
    
    init(movies: [Movie]) {
        self.movies = movies
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: PopularMoviesCodingKeys.self)
        self.movies = try container.decode([Movie].self, forKey: .movies)
    }
}

//
//  Movie.swift
//  MovieApp
//
//  Created by gokalp.koksal on 18.08.2022.
//

import Foundation

struct Movie: Decodable {
    
    enum MovieCodingKeys: String, CodingKey {
        case id
        case title
        case overview
        case posterImagePath = "poster_path"
        case genres
        case duration = "runtime"
    }
    
    let id: Int
    let title: String
    let overview: String
    let posterImagePath: String
    let genres: [Genre]?
    let duration: Int?
    
    init(id: Int, title: String, imagePath: String, overview: String, genres: [Genre], duration: Int) {
        self.id = id
        self.title = title
        self.overview = overview
        self.posterImagePath = imagePath
        self.genres = genres
        self.duration = duration
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: MovieCodingKeys.self)
        self.id = try container.decode(Int.self, forKey: .id)
        self.title = try container.decode(String.self, forKey: .title)
        let path = try container.decode(String.self, forKey: .posterImagePath)
        self.posterImagePath = "https://image.tmdb.org/t/p/w500/" + path
        self.overview = try container.decode(String.self, forKey: .overview)
        self.genres = try container.decodeIfPresent([Genre].self, forKey: .genres)
        self.duration = try container.decodeIfPresent(Int.self, forKey: .duration)
    }
}

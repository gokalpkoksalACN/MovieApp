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
        case language = "original_language"
        case releaseDate = "release_date"
        case voteAverage = "vote_average"
    }
    
    let id: Int
    let title: String
    let overview: String
    let posterImagePath: String
    let genres: [Genre]?
    let duration: Int?
    let language: String
    let releaseDate: Date
    let voteAverage: Double
    
    init(id: Int, title: String, imagePath: String, overview: String, genres: [Genre], duration: Int, language: String, releaseDate: Date, voteAverage: Double) {
        self.id = id
        self.title = title
        self.overview = overview
        self.posterImagePath = imagePath
        self.genres = genres
        self.duration = duration
        self.language = language
        self.releaseDate = releaseDate
        self.voteAverage = voteAverage
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
        self.language = try container.decode(String.self, forKey: .language)
        self.releaseDate = try container.decode(Date.self, forKey: .releaseDate)
        self.voteAverage = try container.decode(Double.self, forKey: .voteAverage)
    }
}

//
//  MovieDetailsPresentation.swift
//  MovieApp
//
//  Created by gokalp.koksal on 25.08.2022.
//

import Foundation

// TODO: Add other details
struct MovieDetailPresentation {
    let title: String
    let overview: String
    let posterImageURL: URL?
    let genres: [Genre]?
    let duration: Int?
    let language: String
    let releaseDate: Date
    
    init(with movie: Movie) {
        self.title = movie.title
        self.overview = movie.overview
        self.posterImageURL = URL(string: movie.posterImagePath)
        self.genres = movie.genres
        self.duration = movie.duration
        self.language = movie.language
        self.releaseDate = movie.releaseDate
    }
}

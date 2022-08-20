//
//  MoviePresentation.swift
//  MovieApp
//
//  Created by gokalp.koksal on 18.08.2022.
//

import Foundation

// TODO: Add other needed movie details
struct MoviePresentation {
    let title: String
    let overview: String
    let image: URL?
    let genres: [Genre]?
    let duration: Int?
    
    init(title: String, overview: String, imagePath: String, genres: [Genre], duration: Int) {
        self.title = title
        self.overview = overview
        self.image = URL(string: imagePath)
        self.genres = genres
        self.duration = duration
    }
    
    init(movie: Movie) {
        self.title = movie.title
        self.overview = movie.overview
        self.image = URL(string: movie.posterImagePath)
        self.genres = movie.genres
        self.duration = movie.duration
    }
}

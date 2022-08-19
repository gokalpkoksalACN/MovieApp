//
//  MoviePresentation.swift
//  MovieApp
//
//  Created by gokalp.koksal on 18.08.2022.
//

import Foundation

// TODO: add duration
struct MoviePresentation {
    let title: String
    let image: URL?
    
    init(title: String, imagePath: String) {
        self.title = title
        self.image = URL(string: imagePath)
    }
    
    init(movie: Movie) {
        self.title = movie.title
        self.image = URL(string: movie.imagePath)
    }
}
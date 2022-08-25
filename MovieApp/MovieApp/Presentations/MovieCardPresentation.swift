//
//  MoviePresentation.swift
//  MovieApp
//
//  Created by gokalp.koksal on 18.08.2022.
//

import Foundation

struct MovieCardPresentation {
    let id: Int
    let title: String
    let image: URL?
    
    init(id: Int, title: String, imagePath: String) {
        self.id = id
        self.title = title
        self.image = URL(string: imagePath)
    }
    
    init(movie: Movie) {
        self.id = movie.id
        self.title = movie.title
        self.image = URL(string: movie.posterImagePath)
    }
}

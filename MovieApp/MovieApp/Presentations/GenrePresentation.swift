//
//  GenrePresentation.swift
//  MovieApp
//
//  Created by gokalp.koksal on 11.08.2022.
//

import Foundation

// TODO: Add Image
struct GenrePresentation {
    let name: String
    
    init(genre: Genre) {
        self.name = genre.name
    }
}

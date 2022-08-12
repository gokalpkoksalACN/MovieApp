//
//  ArtistPresentation.swift
//  MovieApp
//
//  Created by gokalp.koksal on 12.08.2022.
//

import Foundation

struct ArtistPresentation {
    let name: String
    let image: URL?
    
    init(artist: Artist) {
        self.name = artist.name
        self.image = URL(string: artist.imagePath)
    }
}

//
//  MovieDetailsViewModel.swift
//  MovieApp
//
//  Created by gokalp.koksal on 20.08.2022.
//

import Foundation

final class MovieDetailsViewModel: MovieDetailsViewModelProtocol {
    
    weak var delegate: MovieDetailsDelegate?
    private let movie: MoviePresentation
    
    init(movie: MoviePresentation) {
        self.movie = movie
    }
    
    func start() {
        notify(.setMovieTitle(movie.title))
        if let image = movie.image { notify(.setMovieImage(image)) }
        notify(.setMovieOverview(movie.overview))
    }
    
    private func notify(_ output: MovieDetailsViewModelOutput) {
        delegate?.handleViewModelOutput(output)
    }
    
}

//
//  MovieDetailsViewModel.swift
//  MovieApp
//
//  Created by gokalp.koksal on 20.08.2022.
//

import Foundation

final class MovieDetailsViewModel: MovieDetailsViewModelProtocol {
    
    weak var delegate: MovieDetailsDelegate?
    private let movie: MovieCardPresentation
    private let service: MovieDetailsAPI
    
    init(movie: MovieCardPresentation, service: MovieDetailsAPI) {
        self.movie = movie
        self.service = service
    }
    
    func start() {
        getMovieDetails(with: movie.id)
    }
    
    private func getMovieDetails(with id: Int) {
        service.getMovieDetails(with: id) { result in
            switch result {
            case .success(let movie):
                let presentation = MovieDetailPresentation(with: movie)
                self.notify(.setMovieDetails(presentation))
            case .failure(let error):
                // TODO: handle error
                print(error)
            }
        }
    }
    
    private func notify(_ output: MovieDetailsViewModelOutput) {
        delegate?.handleViewModelOutput(output)
    }
    
}

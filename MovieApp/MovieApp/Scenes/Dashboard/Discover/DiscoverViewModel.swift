//
//  DiscoverViewModel.swift
//  MovieApp
//
//  Created by gokalp.koksal on 18.08.2022.
//

import Foundation

final class DiscoverViewModel: DiscoverViewModelProtocol {
    
    weak var delegate: DiscoverDelegate?
    private let service: MovieDiscoverAPI
    
    init(service: MovieDiscoverAPI) {
        self.service = service
    }
    
    func start() {
        fetchPopularMovies()
        fetchUpcomingMovies()
        fetchRecentMovies()
    }
    
    private func fetchPopularMovies() {
        service.getPopularMovies { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let response):
                let presentations = response.movies.map { MovieCardPresentation(movie: $0) }
                self.notify(.updatePopularMovies(presentations))
            case .failure(let error):
                print(error)
            }
        }
    }
    
    private func fetchUpcomingMovies() {
        service.getUpcomingMovies { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let response):
                let presentations = response.movies.map { MovieCardPresentation(movie: $0) }
                self.notify(.updateUpcomingMovies(presentations))
            case .failure(let error):
                print(error)
            }
        }
    }
    
    private func fetchRecentMovies() {
        service.getRecentMovies { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let response):
                let presentations = response.movies.map { MovieCardPresentation(movie: $0) }
                self.notify(.updateRecentMovies(presentations))
            case .failure(let error):
                print(error)
            }
        }
    }
    
    private func notify(_ output: DiscoverViewModelOutput) {
        delegate?.handleViewModelOutput(output)
    }
}

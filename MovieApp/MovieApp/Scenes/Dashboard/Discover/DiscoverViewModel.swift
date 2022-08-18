//
//  DiscoverViewModel.swift
//  MovieApp
//
//  Created by gokalp.koksal on 18.08.2022.
//

import Foundation

final class DiscoverViewModel: DiscoverViewModelProtocol {
    
    weak var delegate: DiscoverDelegate?
    private let service: MovieAppServiceProtocol
    
    init(service: MovieAppServiceProtocol) {
        self.service = service
    }
    
    func start() {
        fetchPopularMovies()
    }
    
    private func fetchPopularMovies() {
        self.notify(.setLoading(true))
        service.getPopularMovies { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let response):
                self.notify(.setLoading(false))
                let presentations = response.movies.map { MoviePresentation(movie: $0) }
                self.notify(.updatePopularMovies(presentations))
            case .failure(let error):
                self.notify(.setLoading(false))
                print(error)
            }
        }
    }
    
    private func notify(_ output: DiscoverViewModelOutput) {
        delegate?.handleViewModelOutput(output)
    }
}

//
//  GenreViewModel.swift
//  MovieApp
//
//  Created by gokalp.koksal on 11.08.2022.
//

import Foundation

class GenreViewModel: GenreViewModelProtocol {
    
    weak var delegate: GenreDelegate?
    
    private let service: MovieAppServiceProtocol
    
    init(service: MovieAppServiceProtocol) {
        self.service = service
    }
    
    func start() {
        notify(.setLoading(true))
        service.getGenreList { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let response):
                self.notify(.setLoading(false))
                let presentations = response.genres.map { GenrePresentation(genre: $0) }
                self.notify(.updateGenres(presentations))
            case .failure(let error):
                self.notify(.setLoading(false))
                print(error)
            }
        }
    }

    private func notify(_ output: GenreViewModelOutput) {
        delegate?.handleViewModelOutput(output)
    }
    
}

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
        delegate?.handleViewModelOutput(.setLoading(true))
        service.getGenreList { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let response):
                self.delegate?.handleViewModelOutput(.setLoading(false))
                let presentations = response.genres.map { GenrePresentation(genre: $0) }
                self.delegate?.handleViewModelOutput(.updateGenres(presentations))
            case .failure(let error):
                self.delegate?.handleViewModelOutput(.setLoading(false))
                print(error)
            }
        }
    }

}

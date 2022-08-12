//
//  ArtistsViewModel.swift
//  MovieApp
//
//  Created by gokalp.koksal on 12.08.2022.
//

import Foundation

final class ArtistsViewModel: ArtistsViewModelProtocol {
    
    weak var delegate: ArtistsDelegate?
    private let service: MovieAppServiceProtocol
    
    init(service: MovieAppServiceProtocol) {
        self.service = service
    }
    
    func start() {
        service.getArtists { [weak self] result in
            guard let self = self else { return }
            self.notify(.setLoading(true))
            switch result {
            case .success(let response):
                self.notify(.setLoading(false))
                let presentations = response.artists.map { ArtistPresentation(artist: $0) }
                self.notify(.updateArtists(presentations))
            case .failure(let error):
                self.notify(.setLoading(false))
                print(error)
            }
        }
    }
    
    private func notify(_ output: ArtistViewModelOutput) {
        delegate?.handleViewModelOutput(output)
    }
}

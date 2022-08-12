//
//  ArtistsContracts.swift
//  MovieApp
//
//  Created by gokalp.koksal on 12.08.2022.
//

import Foundation

protocol ArtistsViewModelProtocol {
    var delegate: ArtistsDelegate? { get set }
    func start()
}

protocol ArtistsDelegate: AnyObject {
    func handleViewModelOutput(_ output: ArtistViewModelOutput)
}

enum ArtistViewModelOutput {
    case updateArtists([ArtistPresentation])
    case setLoading(Bool)
}

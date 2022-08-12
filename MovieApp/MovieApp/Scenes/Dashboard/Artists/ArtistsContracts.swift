//
//  ArtistsContracts.swift
//  MovieApp
//
//  Created by gokalp.koksal on 12.08.2022.
//

import Foundation

protocol ArtistsViewModelProtocol {
    var delegate: ArtistDelegate? { get set }
    func start()
}

protocol ArtistDelegate: AnyObject {
    func handleViewModelOutput(_ output: ArtistViewModelOutput)
}

enum ArtistViewModelOutput {
    case updateArtists([ArtistPresentation])
    case setLoading(Bool)
}

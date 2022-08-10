//
//  GenreContracts.swift
//  MovieApp
//
//  Created by gokalp.koksal on 10.08.2022.
//

import Foundation

protocol GenreViewModelProtocol {
    var delegate: GenreDelegate? { get set }
    func start()
}

protocol GenreDelegate {
    func handleViewModelOutput(_ output: GenreViewModelOutput)
}

enum GenreViewModelOutput {
    case updateGenres([GenrePresentation])
    case setLoading(Bool)
}

struct GenrePresentation {
    let image: URL
    let name: String
}

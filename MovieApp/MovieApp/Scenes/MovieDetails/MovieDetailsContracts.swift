//
//  MovieDetailsContracts.swift
//  MovieApp
//
//  Created by gokalp.koksal on 20.08.2022.
//

import Foundation

protocol MovieDetailsDelegate: AnyObject {
    func handleViewModelOutput(_ output: MovieDetailsViewModelOutput)
}

protocol MovieDetailsViewModelProtocol {
    var delegate: MovieDetailsDelegate? { get set }
    func start()
}

enum MovieDetailsViewModelOutput {
    case setMovieTitle(String)
    case setMovieOverview(String)
    case setMovieImage(URL)
}



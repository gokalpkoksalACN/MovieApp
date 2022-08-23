//
//  DisvocerContracts.swift
//  MovieApp
//
//  Created by gokalp.koksal on 18.08.2022.
//

import Foundation

protocol DiscoverDelegate: AnyObject {
    func handleViewModelOutput(_ output: DiscoverViewModelOutput)
}

protocol DiscoverViewModelProtocol {
    var delegate: DiscoverDelegate? { get set }
    func start()
}

enum DiscoverViewModelOutput {
    case updatePopularMovies([MoviePresentation])
    case updateRecentMovies([MoviePresentation])
    case updateUpcomingMovies([MoviePresentation])
}


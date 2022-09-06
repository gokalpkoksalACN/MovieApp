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
    private var currentPopularMoviesPage = 1
    private var currentRecentMoviesPage = 1
    private var currentUpcomingMoviesPage = 1
    private var isFetchPopularInProgress = false
    private var isFetchRecentInProgress = false
    private var isFetchUpcomingInProgress = false
    
    init(service: MovieDiscoverAPI) {
        self.service = service
    }
    
    func start() {
        fetchPopularMovies()
        fetchUpcomingMovies()
        fetchRecentMovies()
    }
    
    func onDidScrollToTheEnd(with cellType: DiscoverCellType) {
        switch cellType {
        case .Popular:
            fetchPopularMovies()
        case .Recent:
            fetchRecentMovies()
        case .Upcoming:
            fetchUpcomingMovies()
        case .Undefined:
            // do nothing
            print()
        }
    }
    
    private func fetchPopularMovies() {
        if !isFetchPopularInProgress {
            isFetchPopularInProgress = true
            service.getPopularMovies(page: currentPopularMoviesPage) { [weak self] result in
                guard let self = self else { return }
                switch result {
                case .success(let response):
                    let presentations = response.movies.map { MovieCardPresentation(movie: $0) }
                    self.notify(.updatePopularMovies(presentations))
                    self.isFetchPopularInProgress = false
                    self.currentPopularMoviesPage += 1
                case .failure(let error):
                    print(error)
                    self.isFetchPopularInProgress = false
                }
            }
        }
    }
    
    private func fetchUpcomingMovies() {
        if !isFetchUpcomingInProgress {
            isFetchUpcomingInProgress = true
            service.getUpcomingMovies(page: currentUpcomingMoviesPage) { [weak self] result in
                guard let self = self else { return }
                switch result {
                case .success(let response):
                    let presentations = response.movies.map { MovieCardPresentation(movie: $0) }
                    self.notify(.updateUpcomingMovies(presentations))
                    self.isFetchUpcomingInProgress = false
                    self.currentUpcomingMoviesPage += 1
                case .failure(let error):
                    print(error)
                    self.isFetchUpcomingInProgress = false
                }
            }
        }
    }
    
    private func fetchRecentMovies() {
        if !isFetchRecentInProgress {
            isFetchRecentInProgress = true
            service.getRecentMovies(page: currentRecentMoviesPage) { [weak self] result in
                guard let self = self else { return }
                switch result {
                case .success(let response):
                    let presentations = response.movies.map { MovieCardPresentation(movie: $0) }
                    self.notify(.updateRecentMovies(presentations))
                    self.isFetchRecentInProgress = false
                    self.currentRecentMoviesPage += 1
                case .failure(let error):
                    print(error)
                    self.isFetchRecentInProgress = false
                }
            }
        }
        
    }
    
    private func notify(_ output: DiscoverViewModelOutput) {
        delegate?.handleViewModelOutput(output)
    }
}

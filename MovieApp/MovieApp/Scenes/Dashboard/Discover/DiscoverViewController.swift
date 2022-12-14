//
//  DiscoverViewController.swift
//  MovieApp
//
//  Created by gokalp.koksal on 9.08.2022.
//

import UIKit

struct MoviesCellPresentation {
    let isAnimating: Bool
    let movies: [MovieCardPresentation]
}
class DiscoverViewController: UIViewController, DiscoverDelegate {

    @IBOutlet private weak var tableView: UITableView!
    
    private var popularMoviesCellPresentation = MoviesCellPresentation(isAnimating: true, movies: [])
    private var upcomingMoviesCellPresentation = MoviesCellPresentation(isAnimating: true, movies: [])
    private var recentMoviesCellPresentation = MoviesCellPresentation(isAnimating: true, movies: [])
    
    private let viewModel = DiscoverViewModel(service: MovieAppService())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureContent()
        viewModel.delegate = self
        viewModel.start()
    }

    func handleViewModelOutput(_ output: DiscoverViewModelOutput) {
        switch output {
        case .updatePopularMovies(let presentations):
            updateTableViewSection(with: presentations, cellType: .Popular)
        case .updateRecentMovies(let presentations):
            updateTableViewSection(with: presentations, cellType: .Recent)
        case .updateUpcomingMovies(let presentations):
            updateTableViewSection(with: presentations, cellType: .Upcoming)
        }
    }
    
    private func configureContent() {
        setTitle()
        configureTableView()
        configureTabBar()
    }
    
    private func configureTabBar() {
        tabBarController?.tabBar.tintColor = AppColors.tealBlue
    }
    
    private func setTitle() {
        title = "Discover"
        self.navigationController?.navigationBar.titleTextAttributes = [ NSAttributedString.Key.font: UIFont(name: "AppleGothic", size: 17)!]
    }
    
    private func configureTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.allowsSelection = false
        tableView.backgroundColor = AppColors.veryLightPink
        tableView.register(MovieCellHeaderView.self, forHeaderFooterViewReuseIdentifier: MovieCellHeaderView.identifier)
        tableView.register(DiscoverTableViewCell.nib(), forCellReuseIdentifier: DiscoverTableViewCell.identifier)
        tableView.separatorStyle = .none
    }
    
    // TODO: Fix tableView reload style
    private func updateTableViewSection(with movies: [MovieCardPresentation], cellType: DiscoverCellType) {
        switch cellType {
        case .Popular:
            let currentMovies = self.popularMoviesCellPresentation.movies
            let updatedMovies = currentMovies + movies
            self.popularMoviesCellPresentation = MoviesCellPresentation(isAnimating: false, movies: updatedMovies)
            let indexPath = IndexPath(row: 0, section: 0)
            tableView.reloadRows(at: [indexPath], with: .none)
        case .Recent:
            let currentMovies = self.recentMoviesCellPresentation.movies
            let updatedMovies = currentMovies + movies
            self.recentMoviesCellPresentation = MoviesCellPresentation(isAnimating: false, movies: updatedMovies)
            let indexPath = IndexPath(row: 0, section: 1)
            tableView.reloadRows(at: [indexPath], with: .none)
        case .Upcoming:
            let currentMovies = self.upcomingMoviesCellPresentation.movies
            let updatedMovies = currentMovies + movies
            self.upcomingMoviesCellPresentation = MoviesCellPresentation(isAnimating: false, movies: updatedMovies)
            let indexPath = IndexPath(row: 0, section: 2)
            tableView.reloadRows(at: [indexPath], with: .none)
        case .Undefined:
            break
        }
    }
    
}

extension DiscoverViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Do nothing.
    }
    
}

extension DiscoverViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: DiscoverTableViewCell.identifier, for: indexPath) as! DiscoverTableViewCell
        switch indexPath.section {
        case 0:
            cell.configure(with: popularMoviesCellPresentation)
            cell.type = .Popular
        case 1:
            cell.configure(with: recentMoviesCellPresentation)
            cell.type = .Recent
        case 2:
            cell.configure(with: upcomingMoviesCellPresentation)
            cell.type = .Upcoming
        default:
            break
        }
        
        cell.onMovieSelect = { movie in
            let storyboard = UIStoryboard(name: "MovieDetails", bundle: nil)
            let viewController = storyboard.instantiateViewController(withIdentifier: "MovieDetailsViewController") as! MovieDetailsViewController
            viewController.viewModel = MovieDetailsViewModel(movie: movie, service: MovieAppService())
            self.navigationController?.pushViewController(viewController, animated: true)
        }
        
        cell.onDidScrollToTheEnd = { cellType in
            self.viewModel.onDidScrollToTheEnd(with: cellType)
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: MovieCellHeaderView.identifier) as! MovieCellHeaderView
        switch section {
        case 0:
            header.setup(with: "Most Popular")
        case 1:
            header.setup(with: "Most Recent")
        case 2:
            header.setup(with: "Coming Soon")
            
        default:
            break
        }
        return header
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 230
    }
}

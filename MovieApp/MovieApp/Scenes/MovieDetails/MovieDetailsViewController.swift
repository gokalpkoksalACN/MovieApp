//
//  MovieDetailsViewController.swift
//  MovieApp
//
//  Created by gokalp.koksal on 20.08.2022.
//

import UIKit

// TODO: Implement other view elements
class MovieDetailsViewController: UIViewController, MovieDetailsDelegate {

    @IBOutlet private weak var moviePosterImageView: UIImageView! {
        didSet {
            moviePosterImageView.contentMode = .scaleAspectFill
        }
    }

    @IBOutlet private weak var movieTitleLabel: UILabel! {
        didSet {
            movieTitleLabel.numberOfLines = 0
            movieTitleLabel.font = .appFont(with: 18)
            movieTitleLabel.textColor = AppColors.greyishBrown
        }
    }
    
    @IBOutlet private weak var movieGenresLabel: UILabel! {
        didSet {
            movieGenresLabel.numberOfLines = 0
            movieGenresLabel.font = .appFont(with: 13)
            movieGenresLabel.textColor = AppColors.greyishBrown
        }
    }
    
    // TODO: Implement see more button for overview
    @IBOutlet private weak var movieOverviewLabel: UILabel! {
        didSet {
            movieOverviewLabel.numberOfLines = 0
            movieOverviewLabel.font = .appFont(with: 14)
        }
    }
    
    var viewModel: MovieDetailsViewModelProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel?.delegate = self
        viewModel?.start()
    }
    
    func handleViewModelOutput(_ output: MovieDetailsViewModelOutput) {
        switch output {
        // TODO: set other details
        case .setMovieDetails(let movie):
            if let url = movie.posterImageURL {
                moviePosterImageView?.setImage(with: url)
            }
            movieTitleLabel?.text = movie.title
            if let genres = movie.genres {
                movieGenresLabel.text = getGenresString(for: genres)
            }
            movieOverviewLabel?.text = movie.overview
            
        }
    }
    
    private func getGenresString(for genres: [Genre]) -> String {
        var genresString = ""
        for genre in genres {
            genresString.append(contentsOf: genre.description + " | ")
        }
        genresString.removeLast(2)
        return genresString
    }
}

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
    // TODO: Fix font
    @IBOutlet private weak var movieTitleLabel: UILabel!
    
    // TODO: Implement see more button for overview
    @IBOutlet private weak var movieOverviewLabel: UILabel! {
        didSet {
            movieOverviewLabel.numberOfLines = 0
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
        case .setMovieTitle(let title):
            movieTitleLabel?.text = title
        case .setMovieOverview(let overview):
            movieOverviewLabel?.text = overview
        case .setMovieImage(let url):
            moviePosterImageView?.setKingfisherImage(with: url)
        }
    }
}

//
//  GenreViewController.swift
//  MovieApp
//
//  Created by gokalp.koksal on 9.08.2022.
//

import UIKit

// TODO: Implement search view
class GenreViewController: UIViewController, GenreDelegate {

    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var activityIndicator: UIActivityIndicatorView! {
        didSet {
            activityIndicator.hidesWhenStopped = true
        }
    }
    
    private var presentations: [GenrePresentation] = []
    
    private let viewModel = GenreViewModel(service: MovieAppService())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureContent()
        viewModel.delegate = self
        viewModel.start()
    }
    
    func handleViewModelOutput(_ output: GenreViewModelOutput) {
        switch output {
        case .updateGenres(let presentations):
            self.presentations = presentations
            tableView.reloadData()
        case .setLoading(let isAnimating):
            if isAnimating {
                activityIndicator.startAnimating()
            } else {
                activityIndicator.stopAnimating()
            }
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
        title = "Genres"
        self.navigationController?.navigationBar.titleTextAttributes = [ NSAttributedString.Key.font: UIFont(name: "AppleGothic", size: 17)!]
    }
    
    private func configureTableView() {
        tableView.dataSource = self
        tableView.delegate = self
    }
    
}

extension GenreViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("tapped")
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: GenreTableViewCell.identifier, for: indexPath) as! GenreTableViewCell
        let presentation = presentations[indexPath.item]
        
        // TODO: Fix
        if indexPath.item % 2 == 0 {
            cell.genreImageView.image = UIImage(named: "genre_action")
        } else {
            cell.genreImageView.image = UIImage(named: "genre_adventure")
        }
        
        cell.setup(with: presentation)
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presentations.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 170.0
    }
}

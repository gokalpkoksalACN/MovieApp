//
//  GenreViewController.swift
//  MovieApp
//
//  Created by gokalp.koksal on 9.08.2022.
//

import UIKit

class GenreViewController: UIViewController, GenreDelegate {

    @IBOutlet private weak var tableView: UITableView!
    private var presentations: [GenrePresentation] = []
    
    private let viewModel = GenreViewModel(service: MovieAppService())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Genres"
        configureTableView()
        self.navigationController?.navigationBar.titleTextAttributes = [ NSAttributedString.Key.font: UIFont(name: "AppleGothic", size: 17)!]
        viewModel.delegate = self
        viewModel.start()
    }
    
    private func configureTableView() {
        tableView.dataSource = self
        tableView.delegate = self
    }

    func handleViewModelOutput(_ output: GenreViewModelOutput) {
        // TODO: Implement
        switch output {
        case .updateGenres(let presentations):
            self.presentations = presentations
            tableView.reloadData()
        //case .setLoading(let isAnimating):
        }
    }
    
}

extension GenreViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("tapped")
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: GenreTableViewCell.identifier, for: indexPath) as! GenreTableViewCell
        let presentation = presentations[indexPath.item]
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

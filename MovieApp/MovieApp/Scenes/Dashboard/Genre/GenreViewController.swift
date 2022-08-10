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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Genres"
        configureTableView()
    }
    
    private func configureTableView() {
        tableView.dataSource = self
        tableView.delegate = self
    }

    func handleViewModelOutput(_ output: GenreViewModelOutput) {
        // TODO: Implement
//        switch output {
//        case .updateGenres(let presentations):
//        case .setLoading(let isAnimating):
//        }
    }
    
}

extension GenreViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("tapped")
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // TODO: inject corresponding presentation object to the cell and remove lines 47 and 48.
        let cell = tableView.dequeueReusableCell(withIdentifier: GenreTableViewCell.identifier, for: indexPath) as! GenreTableViewCell
        cell.backgroundColor = .green
        cell.genreImageView.image = UIImage(named: "breakingBad")
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // TODO: return presentation count
        return 5
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 170.0
    }
}

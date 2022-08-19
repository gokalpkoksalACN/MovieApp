//
//  DiscoverViewController.swift
//  MovieApp
//
//  Created by gokalp.koksal on 9.08.2022.
//

import UIKit

class DiscoverViewController: UIViewController, DiscoverDelegate {

    @IBOutlet private weak var tableView: UITableView!
    
    private var popularMovies: [MoviePresentation] = []
    private var upcomingMovies: [MoviePresentation] = []
    private var recentMovies: [MoviePresentation] = []
    
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
            self.popularMovies = presentations
            tableView.reloadData()
        case .updateRecentMovies(let presentations):
            self.recentMovies = presentations
            tableView.reloadData()
        case .updateUpcomingMovies(let presentations):
            self.upcomingMovies = presentations
            tableView.reloadData()
        case .setLoading(let isAnimating):
            // TODO: Implement loading animation
            print(isAnimating)
        }
    }
    
    private func configureContent() {
        setTitle()
        configureTableView()
        configureTabBar()
    }
    
    private func configureTabBar() {
        tabBarController?.tabBar.tintColor = UIColor(red: 2/255, green: 148/255, blue: 165/255, alpha: 1.0)
    }
    
    private func setTitle() {
        title = "Discover"
        self.navigationController?.navigationBar.titleTextAttributes = [ NSAttributedString.Key.font: UIFont(name: "AppleGothic", size: 17)!]
    }
    
    private func configureTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.allowsSelection = false
        tableView.backgroundColor = UIColor(red: 238/255, green: 238/255, blue: 238/255, alpha: 238/255)
        tableView.register(MovieCellHeaderView.self, forHeaderFooterViewReuseIdentifier: MovieCellHeaderView.identifier)
        tableView.register(DiscoverTableViewCell.nib(), forCellReuseIdentifier: DiscoverTableViewCell.identifier)
        tableView.separatorStyle = .none
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
            cell.configure(with: popularMovies)
        case 1:
            cell.configure(with: upcomingMovies)
        case 2:
            cell.configure(with: recentMovies)
        default:
            break
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: MovieCellHeaderView.identifier) as! MovieCellHeaderView
        switch section {
        case 0:
            header.setup(with: "Most Popular")
        case 1:
            header.setup(with: "Upcoming Movies")
        case 2:
            header.setup(with: "Most Recent")
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

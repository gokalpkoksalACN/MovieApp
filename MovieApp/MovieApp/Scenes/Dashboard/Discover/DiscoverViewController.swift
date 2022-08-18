//
//  DiscoverViewController.swift
//  MovieApp
//
//  Created by gokalp.koksal on 9.08.2022.
//

import UIKit

class DiscoverViewController: UIViewController {

    @IBOutlet private weak var tableView: UITableView!
    
    // TODO: get sections from api
    private let discoverSections: [DiscoverSectionPresentation] = [
        DiscoverSectionPresentation(title: "Most Popular",
                                    movies: [
                                        MoviePresentation(title: "Batman"),
                                        MoviePresentation(title: "Superman")
                                    ]),
        DiscoverSectionPresentation(title: "Upcoming Soon",
                                    movies: [
                                        MoviePresentation(title: "Thor"),
                                        MoviePresentation(title: "Arrow")
                                    ])
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Discover"
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
        return discoverSections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: DiscoverTableViewCell.identifier, for: indexPath) as! DiscoverTableViewCell
        cell.configure(with: discoverSections[indexPath.item])
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: MovieCellHeaderView.identifier) as! MovieCellHeaderView
        header.setup(with: discoverSections[section].title)
        return header
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 230
    }
}

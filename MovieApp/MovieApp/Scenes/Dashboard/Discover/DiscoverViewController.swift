//
//  DiscoverViewController.swift
//  MovieApp
//
//  Created by gokalp.koksal on 9.08.2022.
//

import UIKit

class DiscoverViewController: UIViewController {

    @IBOutlet private weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }

}

extension DiscoverViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // TODO: Implement
    }
    
}

extension DiscoverViewController: UITableViewDataSource {
    
    // TODO: Fix
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    // TODO: Fix
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.backgroundColor = .systemPink
        return cell
    }
    
}

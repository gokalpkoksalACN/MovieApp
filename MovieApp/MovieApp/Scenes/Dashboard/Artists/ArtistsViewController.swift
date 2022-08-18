//
//  ArtistsViewController.swift
//  MovieApp
//
//  Created by gokalp.koksal on 9.08.2022.
//

import UIKit

// TODO: add pagination and images of artists
class ArtistsViewController: UIViewController, ArtistsDelegate {

    @IBOutlet private weak var collectionView: UICollectionView!
    @IBOutlet private weak var activityIndicator: UIActivityIndicatorView! {
        didSet {
            activityIndicator.hidesWhenStopped = true
        }
    }
    
    private let viewModel = ArtistsViewModel(service: MovieAppService())
    private var presentations: [ArtistPresentation] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTitle()
        configureContent()
        viewModel.delegate = self
        viewModel.start()
    }
    
    func handleViewModelOutput(_ output: ArtistViewModelOutput) {
        switch output {
        case .updateArtists(let presentations):
            self.presentations = presentations
            collectionView.reloadData()
        case .setLoading(let isAnimating):
            if isAnimating {
                activityIndicator.startAnimating()
            } else {
                activityIndicator.stopAnimating()
            }
        }
    }

    private func setTitle() {
        title = "Artists"
        self.navigationController?.navigationBar.titleTextAttributes = [ NSAttributedString.Key.font: UIFont(name: "AppleGothic", size: 17)!]
    }
    
    private func configureContent() {
        configureCollectionView()
    }
    
    private func configureCollectionView() {
        collectionView.backgroundColor = UIColor(red: 238/255, green: 238/255, blue: 238/255, alpha: 238/255)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.collectionViewLayout = UICollectionViewFlowLayout()
    }
}

extension ArtistsViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // TODO: Implement
        print("artist tapped")
    }
    
}

extension ArtistsViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presentations.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ArtistCollectionViewCell.identifier, for: indexPath) as! ArtistCollectionViewCell
        let presentation = presentations[indexPath.item]
        cell.setup(with: presentation)
        cell.backgroundColor = .white
        return cell
    }
    
}

extension ArtistsViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width: CGFloat = (view.frame.width - 40) / 3
        return CGSize(width: width, height: width + 45)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    }
}

//
//  DiscoverTableViewCell.swift
//  MovieApp
//
//  Created by gokalp.koksal on 18.08.2022.
//

import UIKit

class DiscoverTableViewCell: UITableViewCell {

    @IBOutlet weak var collectionView: UICollectionView!
    
    static let identifier = "DiscoverTableViewCell"
    
    static func nib() -> UINib {
        let nib = UINib(nibName: "DiscoverTableViewCell", bundle: nil)
        return nib
    }
    
    private var movies: [MoviePresentation] = []
    
    override func awakeFromNib() {
        super.awakeFromNib()
        collectionView.delegate = self
        collectionView.dataSource = self
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        collectionView.collectionViewLayout = layout
        collectionView.register(MovieCollectionViewCell.nib(), forCellWithReuseIdentifier: MovieCollectionViewCell.identifier)
        collectionView.backgroundColor = UIColor(red: 238/255, green: 238/255, blue: 238/255, alpha: 238/255)
    }
    
    func configure(with discoverSectionPresentation: DiscoverSectionPresentation ) {
        self.movies = discoverSectionPresentation.movies
        collectionView.reloadData()
    }
}

extension DiscoverTableViewCell: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("collectionViewCell tapped")
    }
}

extension DiscoverTableViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MovieCollectionViewCell.identifier, for: indexPath) as! MovieCollectionViewCell
        cell.backgroundColor = .white
        cell.configure(with: movies[indexPath.item])
        return cell
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movies.count
    }
    
}

extension DiscoverTableViewCell: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 136.0, height: 226.0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
    }
}

//
//  DiscoverTableViewCell.swift
//  MovieApp
//
//  Created by gokalp.koksal on 18.08.2022.
//

import UIKit

enum DiscoverCellType {
    case Popular
    case Recent
    case Upcoming
    case Undefined
}

// TODO: extract business logic to a viewModel
class DiscoverTableViewCell: UITableViewCell {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView! {
        didSet {
            activityIndicator.hidesWhenStopped = true
        }
    }
    
    var onMovieSelect: ((MovieCardPresentation) -> Void)?
    var onDidScrollToTheEnd: ((DiscoverCellType) -> Void)?
    var type: DiscoverCellType = .Undefined
    
    static let identifier = "DiscoverTableViewCell"
    
    static func nib() -> UINib {
        let nib = UINib(nibName: "DiscoverTableViewCell", bundle: nil)
        return nib
    }
    
    private var movies: [MovieCardPresentation] = []
    private var isAnimating: Bool = true
    
    override func awakeFromNib() {
        super.awakeFromNib()
        collectionView.delegate = self
        collectionView.dataSource = self
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        collectionView.collectionViewLayout = layout
        collectionView.register(MovieCollectionViewCell.nib(), forCellWithReuseIdentifier: MovieCollectionViewCell.identifier)
        collectionView.register(MoviesFooterCollectionReusableCell.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: MoviesFooterCollectionReusableCell.identifier)
        collectionView.backgroundColor = AppColors.veryLightPink
    }
    
    func configure(with presentation: MoviesCellPresentation) {
        self.movies = presentation.movies
        self.isAnimating = presentation.isAnimating
        activityIndicatorUpdate()
        collectionView.reloadData()
    }
    
    private func activityIndicatorUpdate() {
        if self.isAnimating {
            self.activityIndicator.startAnimating()
        } else {
            self.activityIndicator.stopAnimating()
        }
    }
}

extension DiscoverTableViewCell: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        onMovieSelect?(movies[indexPath.item])
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
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let footerView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: MoviesFooterCollectionReusableCell.identifier, for: indexPath) as! MoviesFooterCollectionReusableCell
        footerView.configure()
        return footerView
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        return CGSize(width: 50, height: collectionView.contentSize.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplaySupplementaryView view: UICollectionReusableView, forElementKind elementKind: String, at indexPath: IndexPath) {
        if movies.count > 10, elementKind == UICollectionView.elementKindSectionFooter {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                self.onDidScrollToTheEnd?(self.type)
            }
        }
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

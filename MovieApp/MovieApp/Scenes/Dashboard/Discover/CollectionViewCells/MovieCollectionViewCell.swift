//
//  MovieCollectionViewCell.swift
//  MovieApp
//
//  Created by gokalp.koksal on 18.08.2022.
//

import UIKit

class MovieCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "MovieCollectionViewCell"
    static func nib() -> UINib {
        let nib = UINib(nibName: "MovieCollectionViewCell", bundle: nil)
        return nib
    }

    @IBOutlet private weak var movieImageView: UIImageView! {
        didSet {
            movieImageView.backgroundColor = .lightGray
            movieImageView.contentMode = .scaleAspectFill
        }
    }
    @IBOutlet private weak var movieTitleLabel: UILabel!
    @IBOutlet private weak var movieDurationTitle: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    // TODO: fix image
    func configure(with movie: MoviePresentation) {
        movieImageView.image = UIImage(named: "walkingDead")
        movieTitleLabel.text = movie.title
    }
}

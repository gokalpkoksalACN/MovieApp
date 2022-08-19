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
    @IBOutlet private weak var movieTitleLabel: UILabel! {
        didSet {
            // TODO: Fix number of lines
            movieTitleLabel.font = UIFont(name: "AppleGothic", size: 14)
            movieTitleLabel.textColor = UIColor(red: 74/255, green: 74/255, blue: 74/255, alpha: 1.0)
        }
    }
    
    @IBOutlet private weak var movieDurationTitle: UILabel! {
        didSet{
            // TODO: Fix duration
            movieDurationTitle.text = "1h, 25mins"
            movieDurationTitle.font = UIFont(name: "AppleGothic", size: 12)
            movieDurationTitle.textColor = UIColor(red: 155/255, green: 155/255, blue: 155/255, alpha: 1.0)
        }
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configure(with movie: MoviePresentation) {
        if let image = movie.image {
            movieImageView.setKingfisherImage(with: image)
        }
        movieTitleLabel.text = movie.title
    }
}
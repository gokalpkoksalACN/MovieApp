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
    
    private var imageDownloadTask: ImageTask?

    @IBOutlet private weak var movieImageView: UIImageView! {
        didSet {
            movieImageView.backgroundColor = .lightGray
            movieImageView.contentMode = .scaleAspectFill
        }
    }
    @IBOutlet private weak var movieTitleLabel: UILabel! {
        didSet {
            movieTitleLabel.numberOfLines = 0
            movieTitleLabel.font = UIFont(name: "AppleGothic", size: 14)
            movieTitleLabel.textColor = AppColors.greyishBrown
        }
    }
    
    @IBOutlet private weak var movieDurationTitle: UILabel! {
        didSet{
            // TODO: Fix duration
            movieDurationTitle.text = "1h, 25mins"
            movieDurationTitle.font = UIFont(name: "AppleGothic", size: 12)
            movieDurationTitle.textColor = AppColors.brownGrey
        }
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configure(with movie: MovieCardPresentation) {
        if let image = movie.image {
            self.imageDownloadTask = movieImageView.setImage(with: image)
        }
        movieTitleLabel.text = movie.title
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        imageDownloadTask?.cancel()
    }
}

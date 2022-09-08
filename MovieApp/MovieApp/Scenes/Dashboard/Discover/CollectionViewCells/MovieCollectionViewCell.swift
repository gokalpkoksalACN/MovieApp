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

    // TODO: Implement spinner for image loading
    @IBOutlet private weak var movieImageView: UIImageView! {
        didSet {
            movieImageView.backgroundColor = .lightGray
            movieImageView.contentMode = .scaleAspectFill
        }
    }
    @IBOutlet private weak var movieTitleLabel: UILabel! {
        didSet {
            movieTitleLabel.numberOfLines = 0
            movieTitleLabel.font = .appFont(with: 14)
            movieTitleLabel.textColor = AppColors.greyishBrown
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

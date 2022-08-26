//
//  ArtistCollectionViewCell.swift
//  MovieApp
//
//  Created by gokalp.koksal on 12.08.2022.
//

import UIKit

class ArtistCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "ArtistCollectionViewCell"
    
    private var imageDownloadTask: ImageTask?
    
    @IBOutlet weak var imageView: UIImageView! {
        didSet {
            imageView.contentMode = .scaleAspectFill
            imageView.backgroundColor = .lightGray
        }
    }
    
    @IBOutlet weak var nameLabel: UILabel! {
        didSet {
            nameLabel.textAlignment = .center
            nameLabel.font = .appFont(with: 14)
            nameLabel.textColor = AppColors.greyishBrown
            nameLabel.numberOfLines = 2
        }
    }
    
    func setup(with presentation: ArtistPresentation) {
        nameLabel.text = presentation.name
        if let imageURL = presentation.image {
            self.imageDownloadTask = imageView.setImage(with: imageURL)
        }
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        imageDownloadTask?.cancel()
    }
}

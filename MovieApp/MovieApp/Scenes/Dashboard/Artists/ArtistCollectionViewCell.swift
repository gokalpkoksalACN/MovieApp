//
//  ArtistCollectionViewCell.swift
//  MovieApp
//
//  Created by gokalp.koksal on 12.08.2022.
//

import UIKit

class ArtistCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "ArtistCollectionViewCell"
    
    @IBOutlet weak var imageView: UIImageView! {
        didSet {
            imageView.contentMode = .scaleAspectFill
            imageView.backgroundColor = .lightGray
        }
    }
    
    @IBOutlet weak var nameLabel: UILabel! {
        didSet {
            nameLabel.textAlignment = .center
            nameLabel.font = UIFont(name: "AppleGothic", size: 14)
            nameLabel.textColor = UIColor(red: 74/255, green: 74/255, blue: 74/255, alpha: 1.0)
            nameLabel.numberOfLines = 2
        }
    }
    
    func setup(with presentation: ArtistPresentation) {
        nameLabel.text = presentation.name
    }
}

//
//  LandingScreenCell.swift
//  MovieApp
//
//  Created by gokalp.koksal on 5.08.2022.
//

import UIKit

// TODO: Add title and explore button
class LandingScreenCell: UICollectionViewCell {

    static let identifier = "LandingCell"
    
    private let imageView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayouts()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // TODO: Fix constraints to keep image's widgth/height constant.
    private func setupLayouts() {
        contentView.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.widthAnchor.constraint(equalToConstant: frame.width).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: frame.height).isActive = true
        imageView.backgroundColor = .lightGray
    }
    
    func setup(with imageName: String) {
        imageView.image = UIImage(named: imageName)
    }
}

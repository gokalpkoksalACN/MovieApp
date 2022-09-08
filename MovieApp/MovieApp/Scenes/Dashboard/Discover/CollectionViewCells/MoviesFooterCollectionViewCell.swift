//
//  MoviesFooterCollectionView.swift
//  MovieApp
//
//  Created by gokalp.koksal on 8.09.2022.
//

import UIKit

class MoviesFooterCollectionReusableCell: UICollectionReusableView {
    
    static let identifier = "MoviesFooterCollectionReusableCell"
    
    private let spinner = UIActivityIndicatorView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        spinner.center = CGPoint(x: bounds.midX, y: bounds.midY)
    }
    
    func configure() {
        backgroundColor = AppColors.veryLightPink
        spinner.startAnimating()
        addSubview(spinner)
    }
}

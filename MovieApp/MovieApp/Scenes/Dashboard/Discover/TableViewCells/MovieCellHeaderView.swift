//
//  MovieCellHeaderView.swift
//  MovieApp
//
//  Created by gokalp.koksal on 15.08.2022.
//

import UIKit

// TODO: Fix chevron right icon
class MovieCellHeaderView: UITableViewHeaderFooterView {

    static let identifier = "MovieCellHeaderViewId"
    
    private let seeAllLabel: UILabel = {
        let label = UILabel()
        label.text = "See All"
        label.font = UIFont(name: "AppleGothic", size: 14)
        label.textColor = UIColor(red: 2/255, green: 148/255, blue: 165/255, alpha: 0.8)
        return label
    }()
    
    private let headerTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "MovieHeader"
        label.font = UIFont(name: "AppleGothic", size: 16)
        return label
    }()
    
    private let chevronRightImageView: UIImageView = {
        let image = UIImage(named: "chevron_right")
        let imageView = UIImageView(image: image)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.widthAnchor.constraint(equalToConstant: 20).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 20).isActive = true
        return imageView
    }()
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private let seeAllStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.spacing = 8
        return stackView
    }()
    
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        seeAllStackView.addArrangedSubview(seeAllLabel)
        seeAllStackView.addArrangedSubview(chevronRightImageView)
        stackView.addArrangedSubview(headerTitleLabel)
        stackView.addArrangedSubview(seeAllStackView)
        
        contentView.addSubview(stackView)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()

        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10)
        ])
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup(with title: String) {
        headerTitleLabel.text = title
    }
}

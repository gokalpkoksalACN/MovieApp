//
//  MovieCellHeaderView.swift
//  MovieApp
//
//  Created by gokalp.koksal on 15.08.2022.
//

import UIKit

// TODO: add search button
class MovieCellHeaderView: UITableViewHeaderFooterView {

    static let identifier = "MovieCellHeaderViewId"
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "MovieHeader"
        return label
    }()
    
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        contentView.addSubview(titleLabel)
        contentView.backgroundColor = .blue
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        titleLabel.sizeToFit()
        titleLabel.frame = CGRect(x: 10,
                                  y: 10,
                                  width: contentView.frame.size.width,
                                  height: 18)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup(with title: String) {
        titleLabel.text = title
    }
}

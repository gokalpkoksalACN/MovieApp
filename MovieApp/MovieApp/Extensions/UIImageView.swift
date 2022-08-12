//
//  UIImageView.swift
//  MovieApp
//
//  Created by gokalp.koksal on 12.08.2022.
//

import UIKit
import Kingfisher

extension UIImageView {
    func setKingfisherImage(with url: URL) {
        self.kf.setImage(with: url)
    }
}

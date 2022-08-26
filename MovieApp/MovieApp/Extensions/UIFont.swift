//
//  UIFont.swift
//  MovieApp
//
//  Created by gokalp.koksal on 26.08.2022.
//

import UIKit

extension UIFont {
    static func appFont(with size: CGFloat) -> UIFont {
        guard let font = UIFont(name: "AppleGothic", size: size) else { return UIFont.systemFont(ofSize: 14) }
        return font
    }
}

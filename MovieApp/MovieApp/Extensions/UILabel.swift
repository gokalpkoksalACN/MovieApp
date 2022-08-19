//
//  UILabel.swift
//  MovieApp
//
//  Created by gokalp.koksal on 19.08.2022.
//

import UIKit

extension UILabel {
    func addCharacterSpacing(kernValue: Double) {
        if let text = self.text, text.isEmpty == false {
            let attributedString = NSMutableAttributedString(string: text)
            attributedString.addAttribute(.kern, value: kernValue, range: NSRange(location: 0, length: attributedString.length - 1))
            attributedText = attributedString
        }
    }
}

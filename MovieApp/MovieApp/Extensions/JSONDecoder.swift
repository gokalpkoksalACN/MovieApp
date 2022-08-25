//
//  JSONDecoder.swift
//  MovieApp
//
//  Created by gokalp.koksal on 25.08.2022.
//

import Foundation

extension JSONDecoder {
    static func plainDateDecoder() -> JSONDecoder {
        let decoder = JSONDecoder()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "YYYY-MM-dd"
        decoder.dateDecodingStrategy = .formatted(dateFormatter)
        return decoder
    }
}

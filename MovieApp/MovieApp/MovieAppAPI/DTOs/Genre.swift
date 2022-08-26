//
//  Genre.swift
//  MovieApp
//
//  Created by gokalp.koksal on 11.08.2022.
//

import Foundation

struct Genre: Decodable, CustomStringConvertible {
    let name: String
    var description: String { return self.name }
}

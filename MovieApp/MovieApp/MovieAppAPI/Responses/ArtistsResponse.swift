//
//  ArtistsResponse.swift
//  MovieApp
//
//  Created by gokalp.koksal on 12.08.2022.
//

import Foundation

struct ArtistsResponse: Decodable {
    
    enum ArtistsCodingKeys: String, CodingKey {
        case artists = "results"
    }
    
    let artists: [Artist]
    
    init(artists: [Artist]) {
        self.artists = artists
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: ArtistsCodingKeys.self)
        self.artists = try container.decode([Artist].self, forKey: .artists)
    }
}

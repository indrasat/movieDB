//
//  Movie.swift
//  Movie DB
//
//  Created by Indra on 12/06/20.
//  Copyright © 2020 Indra. All rights reserved.
//

import Foundation

struct Movie: Decodable, Identifiable {
    let id: Int
    let title: String
    let overview: String
    let releaseDate: String
    let posterPath : String?
    
    var formatedReleaseDate: String {
        if releaseDate != "0000-00-00" {
            return Date().formattedDateFromString(dateString: releaseDate, withFormat: "dd MMMM yyyy")!
        }
        return releaseDate
    }
    var image: String {
        if let path = posterPath{
            return K.assetURL + posterPath!
        }else{
            return K.assetURL
        }
    }
    
    private enum CodingKeys: String, CodingKey {
        case id, title, overview, releaseDate = "release_date", posterPath = "poster_path"
    }
}

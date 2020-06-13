//
//  APIResults.swift
//  Movie DB
//
//  Created by Indra on 12/06/20.
//  Copyright © 2020 Indra. All rights reserved.
//

import Foundation

struct APIResults: Decodable {
    let page: Int
    let numResults: Int
    let numPages: Int
    
    private enum CodingKeys: String, CodingKey {
        case page, numResults = "total_results", numPages = "total_pages"
    }
}

struct MovieAPIResults: Decodable {
    let movies: [Movie]
    
    private enum CodingKeys: String, CodingKey {
           case movies = "results"
    }
}

struct ReviewAPIResults: Decodable {
    let reviews: [Review]
    
    private enum CodingKeys: String, CodingKey {
           case reviews = "results"
       }
}

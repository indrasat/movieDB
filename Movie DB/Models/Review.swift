//
//  Review.swift
//  Movie DB
//
//  Created by Indra on 13/06/20.
//  Copyright © 2020 Indra. All rights reserved.
//

import Foundation

struct Review: Decodable, Identifiable {
    var id: String
    var author: String
    var content: String
    var url: String
    
    var hashValue: Int{
        return id.hashValue ^
        author.hashValue ^
        content.hashValue ^
        url.hashValue
    }
}

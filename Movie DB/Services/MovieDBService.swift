//
//  MovieDBService.swift
//  Movie DB
//
//  Created by Indra on 11/06/20.
//  Copyright © 2020 Indra. All rights reserved.
//

import Foundation
import Moya

enum MovieDBService{
    case nowPlaying
    case popular
    case topRated
    case upcoming
    case detail(id: Int)
    case reviews(id: Int)
}

// MARK: - TargetType Protocol Implementation
extension MovieDBService: TargetType {
    var baseURL: URL { return URL(string: K.baseURL+"/"+K.version)! }
    var path: String {
        switch self {
        case .nowPlaying:
            return K.nowPlayingMovie
        case .popular:
            return K.popularMovie
        case .topRated:
            return K.topRatedMovie
        case .upcoming:
            return K.upcomingMovie
        case .detail(let id):
            return "\(K.listMovie)\(id)"
        case .reviews(let id):
            return "\(K.listMovie)\(id)\(K.reviews)"
        }
    }
    var method: Moya.Method {
        switch self {
        case .nowPlaying, .popular, .topRated, .upcoming, .detail, .reviews :
            return .get
        }
    }
    var task: Task {
        switch self {
        case .nowPlaying, .popular, .topRated, .upcoming, .detail, .reviews: 
            var params: [String: Any] = [:]
            params["api_key"] = K.apiKey
            return .requestParameters(parameters: params, encoding: URLEncoding.default)
        }
    }
    var sampleData: Data {
        return Data()
    }
    
    var headers: [String: String]? {
        return ["Content-type": "application/json"]
    }
}
// MARK: - Helpers
private extension String {
    var urlEscaped: String {
        return addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
    }

    var utf8Encoded: Data {
        return data(using: .utf8)!
    }
}

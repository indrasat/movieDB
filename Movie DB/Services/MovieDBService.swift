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
        switch self {
        case .nowPlaying, .popular, .topRated, .upcoming:
            return "[Movie(\"id\": 550, \"title\": \"Fight Club\", \"overview\": \"A ticking-time-bomb insomniac and a slippery soap salesman channel primal male aggression into a shocking new form of therapy. Their concept catches on, with underground \"fight clubs\" forming in every town, until an eccentric gets in the way and ignites an out-of-control spiral toward oblivion.\", \"releaseDate\": \"1999-10-12\", \"posterPath\": null)]".data(using: String.Encoding.utf8)!
        case .detail:
            return "Movie(\"id\": 550, \"title\": \"Fight Club\", \"overview\": \"A ticking-time-bomb insomniac and a slippery soap salesman channel primal male aggression into a shocking new form of therapy. Their concept catches on, with underground \"fight clubs\" forming in every town, until an eccentric gets in the way and ignites an out-of-control spiral toward oblivion.\", \"releaseDate\": \"1999-10-12\", \"posterPath\": null)".data(using: String.Encoding.utf8)!
        default:
            return Data()
        }
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

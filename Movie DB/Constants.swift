//
//  Constants.swift
//  Movie DB
//
//  Created by Indra on 10/06/20.
//  Copyright © 2020 Indra. All rights reserved.
//

import Foundation

struct K {
    //MARK : - API Key
    static let apiKey = "2f2c2b67478cef3d33e9b0b4bc1a892c"
    
    //MARK : - URL Request
    static let baseURL = "https://api.themoviedb.org"
    static let version = "3"
    static let listMovie = "/movie/"
    static let popularMovie = "/movie/popular"
    static let upcomingMovie = "/movie/upcoming"
    static let topRatedMovie = "/movie/top_rated"
    static let nowPlayingMovie = "/movie/now_playing"
    static let reviews = "/reviews"
    
    //MARK : - Movie DB Assets URL
    static let assetURL = "http://image.tmdb.org/t/p/\(posterImageSize)"
    
    //MARK : - Alert Message
    static let defaultAlertTitle = "Movie DB"
    static let defaultAlertMessage = "This is alert Message"
    
    //MARK : - Error Message
    static let errorAlertTitle = "Error"
    static let genericErrorMessage = "Oops! Something Error!"
    
    //MARK : - Main Configuration
    static let appName = Bundle.main.displayName
    static let posterImageSize = "w92"
    static let review = "Review"
    static let thumbnail = "thumbnail"
    static let favouriteHeartIcon = "heart.fill"
    static let heartIcon = "heart"
    static let category = "category"
    static let actionSheetTitle = "Choose Category"
    static let favouriteMenuTitle = "Favourite Movies"
    
    enum Status: String {
        case favourite = "heart.fill"
        case normal = "heart"
    }

    enum ActionSheetOptions: String{
        case popular = "Popular"
        case upComing = "Up Coming"
        case topRating = "Top Rating"
        case nowPlaying = "Now Playing"
    }
    
    
}


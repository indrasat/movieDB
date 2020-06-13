//
//  DetailViewModel.swift
//  Movie DB
//
//  Created by Indra on 12/06/20.
//  Copyright © 2020 Indra. All rights reserved.
//

import Foundation
import Combine
import Moya
import CoreData

class DetailViewModel: ObservableObject {
    let provider = MoyaProvider<MovieDBService>(plugins: [NetworkLoggerPlugin()])
    let request : NSFetchRequest<FavouriteMovies> = FavouriteMovies.fetchRequest()
    var id : Int
    
    @Published var movie: Movie = Movie(id: 0, title: "", overview: "", releaseDate: "0000-00-00", posterPath: "")
    @Published var reviews: [Review] = [Review]()
    @Published var isFavourite : Bool = false
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    
    init(id: Int) {
        self.id = id
    }
    
    func fetchMovieDetail(){
        provider.request(.detail(id: self.id)) { result in
            switch result {
            case let .success(moyaResponse):
                do{
                    self.movie = try JSONDecoder().decode(Movie.self, from: moyaResponse.data)
                }catch let err {
                    print(err)
                }
            case let .failure(moyaError):
                print("There's an error, \(moyaError)")
            }
        }
    }
    
    func fetchReviews(){
        provider.request(.reviews(id: self.id)) { result in
            switch result {
            case let .success(moyaResponse):
                do{
                    let results = try JSONDecoder().decode(ReviewAPIResults.self, from: moyaResponse.data)
                    self.reviews = results.reviews
                }catch let err {
                    print(err)
                }
            case let .failure(moyaError):
                print("There's an error, \(moyaError)")
            }
        }
    }
    
    func loadFavouriteMovies(){
        request.predicate = NSPredicate(format: "id = %@", NSNumber(value: self.movie.id))
        do{
            self.isFavourite = try context.count(for: request) > 0
        }catch{
            print("error executing fetch request: \(error)")
        }
    }
    
    
    func favouriteButtonPressed(){
        request.predicate = NSPredicate(format: "id = %@", NSNumber(value: self.movie.id))
        do{
            let isExist = try context.count(for: request) > 0
            if !isExist {
                saveItem()
            }
        }catch{
            print("error executing fetch request: \(error)")
        }
        
    }
    
    func removeItem(){
        do {
            request.predicate = NSPredicate(format: "id = %@", NSNumber(value: self.movie.id))
            let favouriteMovie = try context.fetch(request).first
            if let movie = favouriteMovie {
                try context.delete(movie)
            }
        } catch {
            print("Error saving context \(error)")
        }
    }
    
    func saveItem(){
        do {
            let newFavouriteMovie = FavouriteMovies(context: self.context)
            newFavouriteMovie.title = self.movie.title
            newFavouriteMovie.overview =  self.movie.overview
            newFavouriteMovie.releaseDate =  self.movie.releaseDate
            newFavouriteMovie.posterPath =  self.movie.posterPath
            newFavouriteMovie.id = NSDecimalNumber(value: self.movie.id)
            try context.save()
        } catch {
            print("Error saving context \(error)")
        }
        
    }
}


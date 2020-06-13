//
//  FavouriteViewModel.swift
//  Movie DB
//
//  Created by Indra on 12/06/20.
//  Copyright © 2020 Indra. All rights reserved.
//

import Foundation
import Combine
import UIKit
import CoreData

class FavouriteViewModel: ObservableObject {
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    @Published var movies = [Movie]()
    
    func loadFavouriteMovies(){
        let request: NSFetchRequest<FavouriteMovies> = FavouriteMovies.fetchRequest()
        do{
            movies = try context.fetch(request).compactMap{Movie(id: $0.id as! Int, title: $0.title!, overview: $0.overview!, releaseDate: $0.releaseDate!, posterPath: $0.posterPath)}
        } catch {
            print("Error loading favourite movies \(error)")
        }
    }
}

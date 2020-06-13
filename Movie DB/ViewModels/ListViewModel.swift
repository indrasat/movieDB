//
//  ListViewModel.swift
//  Movie DB
//
//  Created by Indra on 12/06/20.
//  Copyright © 2020 Indra. All rights reserved.
//

import Foundation
import Combine
import Moya

class ListViewModel: ObservableObject {
    let provider = MoyaProvider<MovieDBService>(plugins: [NetworkLoggerPlugin()])
    
    @Published var movies =  [Movie]()
    
    func fetchMovieList(with movieDBService: MovieDBService){
        provider.request(movieDBService) { result in
            switch result {
            case let .success(moyaResponse):
                do{
                    let results = try JSONDecoder().decode(MovieAPIResults.self, from: moyaResponse.data)
                    self.movies = results.movies
                }catch let err{
                    print(err)
                }

            case let .failure(moyaError):
                print("There's an error, \(moyaError)")
            }
        }
    }

}

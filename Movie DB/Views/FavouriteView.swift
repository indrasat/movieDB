//
//  FavouriteMovieView.swift
//  Movie DB
//
//  Created by Indra on 12/06/20.
//  Copyright © 2020 Indra. All rights reserved.
//

import SwiftUI

struct FavouriteView: View {
    @ObservedObject var favouriteViewModel = FavouriteViewModel()
    
    var body: some View {
        List(favouriteViewModel.movies){ movie in
            NavigationLink(destination: DetailView(id: movie.id)){
                CardView(movie: movie)
            }
            
        }
        .navigationBarTitle(K.favouriteMenuTitle)
        .onAppear(){
            self.favouriteViewModel.loadFavouriteMovies()
        }
        
    }
}

struct FavouriteView_Previews: PreviewProvider {
    static var previews: some View {
        FavouriteView()
    }
}

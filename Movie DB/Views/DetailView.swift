//
//  DetailView.swift
//  Movie DB
//
//  Created by Indra on 12/06/20.
//  Copyright © 2020 Indra. All rights reserved.
//

import SwiftUI
import URLImage

struct DetailView: View {
    @ObservedObject var detailViewModel : DetailViewModel
    @State var favouriteImage : String = K.Status.normal.rawValue
    
    init(id: Int) {
        self.detailViewModel = DetailViewModel(id: id)
        self.detailViewModel.fetchMovieDetail()
        self.detailViewModel.fetchReviews()
    }
    
    var body: some View {
        ScrollView{
            VStack{
                HStack(alignment:.top) {
                    URLImage(URL(string: self.detailViewModel.movie.image)!, placeholder: { _ in
                        Image(K.thumbnail)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100, height: 100)
                    })
                    VStack(alignment: .leading) {
                        Spacer()
                        HStack(alignment: .lastTextBaseline){
                            Text(self.detailViewModel.movie.title)
                                .font(.system(size: 18))
                                .bold()
                                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                            Button(action: {self.onFavouriteButtonPressed()}) {
                                Image(systemName: favouriteImage)
                                    .frame(width:30, height: 30, alignment: .leading)
                            }.accessibility(identifier: K.heartIcon)
                        }
                        Text(self.detailViewModel.movie.formatedReleaseDate)
                            .font(.system(size: 15)).bold()
                            .multilineTextAlignment(.leading)
                        
                        Spacer()
                        
                        Text(self.detailViewModel.movie.overview)
                            .font(.system(size: 13))
                            .multilineTextAlignment(.leading)
                        
                        
                        Spacer()
                    }
                    
                }
            } .layoutPriority(1)
            Spacer()
            ReviewView(reviews: self.detailViewModel.reviews)
        }
        .navigationBarTitle(Text(self.detailViewModel.movie.title))
        .onAppear(){
            self.detailViewModel.loadFavouriteMovies()
            
            if self.detailViewModel.isFavourite {
                self.favouriteImage = K.Status.favourite.rawValue
            }else{
                self.favouriteImage = K.Status.normal.rawValue
            }
        }
        
    }
    
    func onFavouriteButtonPressed(){
        if favouriteImage == K.Status.favourite.rawValue {
            self.detailViewModel.removeItem()
            favouriteImage = K.Status.normal.rawValue
        } else {
            self.detailViewModel.favouriteButtonPressed()
            favouriteImage = K.Status.favourite.rawValue
        }
    }
}



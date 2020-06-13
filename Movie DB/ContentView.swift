//
//  ContentView.swift
//  Movie DB
//
//  Created by Indra on 10/06/20.
//  Copyright © 2020 Indra. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var listViewModel = ListViewModel()
    @State var showActionSheet = false

    
    var body: some View {
        NavigationView{
            VStack{
                List(listViewModel.movies){ movie in
                    NavigationLink(destination: DetailView(id: movie.id)){
                        CardView(movie: movie)
                    }
                }
                Button(action: {self.showActionSheet = true}) {
                    Text(K.category)
                        .foregroundColor(.white)
                }.frame(
                    minWidth: 0, maxWidth: .infinity, alignment: .center)
                    .frame(height:50)
                    .background(Color("MainColor"))
                
                
            }
            .actionSheet(isPresented: $showActionSheet, content: {self.actionSheet})
            .navigationBarTitle(K.appName!)
            .navigationBarItems(trailing:
                NavigationLink(destination: FavouriteView()){
                    Image(systemName: K.Status.favourite.rawValue)
                }
            )
        }
        .onAppear(){
            self.listViewModel.fetchMovieList(with: .nowPlaying)
        }
        
        
    }
    
    var actionSheet: ActionSheet {
        ActionSheet(
            title: Text(K.actionSheetTitle), message: nil,
            buttons: [
                .default(Text(K.ActionSheetOptions.popular.rawValue)){self.listViewModel.fetchMovieList(with: .popular)},
                .default(Text(K.ActionSheetOptions.upComing .rawValue)){self.listViewModel.fetchMovieList(with: .upcoming)},
                .default(Text(K.ActionSheetOptions.topRating .rawValue)){self.listViewModel.fetchMovieList(with: .topRated)},
                .default(Text(K.ActionSheetOptions.nowPlaying .rawValue)){self.listViewModel.fetchMovieList(with: .nowPlaying)},
                .cancel()
        ])
    }
    
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



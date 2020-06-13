//
//  CardView.swift
//  Movie DB
//
//  Created by Indra on 10/06/20.
//  Copyright © 2020 Indra. All rights reserved.
//

import SwiftUI
import URLImage

struct CardView: View{
    let movie: Movie
    
    var body: some View {
        HStack(alignment:.top) {
            URLImage(URL(string: self.movie.image)!, placeholder: { _ in
                Image(K.thumbnail)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
            })
            VStack(alignment: .leading) {
                Spacer()
                HStack(alignment: .lastTextBaseline){
                    Text(movie.title)
                        .font(.system(size: 18))
                        .bold()
                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                }
                Text(movie.formatedReleaseDate)
                    .font(.system(size: 15)).bold()
                    .multilineTextAlignment(.leading)
                
                Spacer()
                
                Text(movie.overview)
                    .font(.system(size: 13))
                    .multilineTextAlignment(.leading)
                    .lineLimit(4)
                
                Spacer()
            }
            
        }
    }
    
    
}



//
//  ReviewView.swift
//  Movie DB
//
//  Created by Indra on 13/06/20.
//  Copyright © 2020 Indra. All rights reserved.
//

import Foundation
import SwiftUI

struct ReviewView: View{
    @State var reviews : [Review]
    
    var body: some View {
        VStack(alignment: .leading){
            Spacer()
            Text(K.review)
                .bold()
                .font(.system(size: 18))
            ForEach(reviews){ review in
                VStack(alignment: .leading){
                    Spacer()
                    Text(review.author)
                        .bold()
                        .font(.system(size: 15))
                        .multilineTextAlignment(.leading)
                    Spacer()
                    Text(review.content)
                        .font(.system(size: 13))
                        .multilineTextAlignment(.leading)
                    Spacer()
                }.fixedSize(horizontal: false, vertical: true)
            }
        }
    }
}

//
//  TinderView.swift
//  TodayAtApple-SwiftUI
//
//  Created by Harry Ng on 3/11/2019.
//  Copyright © 2019 StaySorted Inc. All rights reserved.
//

import SwiftUI
import Combine

struct TinderView: View {
    @ObservedObject var store: FoodStore
    
    var body: some View {
        ZStack {
            BlurView(style: .systemMaterial)
            
            VStack(spacing: 0) {
                ZStack {
                    VStack {
                        Image(systemName: "hourglass")
                            .font(Font.largeTitle.weight(.black))
                        
                        Text("Tasting more food...")
                            .font(.title)
                            .fontWeight(.bold)
                    }
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 600)
                    
                    ForEach(store.foods) { food in
                        CardView(image: food.image, food: food.name, restaurant: food.restaurant)
                    }
                }
            }
            
            Spacer()
        }
        .background(Color.gray)
        .edgesIgnoringSafeArea(.all)
        .onAppear(perform: store.fetch)
    }
}

struct TinderView_Previews: PreviewProvider {
    static var previews: some View {
        TinderView(store: FoodStore())
            .previewDevice("iPhone 11 Pro")
    }
}

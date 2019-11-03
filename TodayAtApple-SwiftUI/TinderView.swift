//
//  TinderView.swift
//  TodayAtApple-SwiftUI
//
//  Created by Harry Ng on 3/11/2019.
//  Copyright © 2019 StaySorted Inc. All rights reserved.
//

import SwiftUI

struct TinderView: View {
    var body: some View {
        ZStack {
            BlurView(style: .systemMaterial)
            
            VStack(spacing: 0) {
                CardView()
                
                MenuView()
            }
            
            Spacer()
        }
        .background(Color.gray)
        .edgesIgnoringSafeArea(.all)
    }
}

struct TinderView_Previews: PreviewProvider {
    static var previews: some View {
        TinderView()
    }
}

struct CardView: View {
    var image: String = "papaya_salad"
    var food: String = "Papaya Salad"
    var restaurant: String = "Pun Pun Market"
    
    var body: some View {
        ZStack(alignment: .leading) {
            Group {
                Image(image)
                    .renderingMode(.original)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
            }
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 600)
            .cornerRadius(10)
            
            VStack(alignment: .leading) {
                Spacer()
                
                Text(food)
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .foregroundColor(.white)
                
                Text(restaurant)
                    .font(.body)
                    .foregroundColor(.white)
            }
            .frame(height: 600)
            .padding()
            .padding(.bottom, 20)
        }
        .cornerRadius(8)
        .shadow(radius: 8)
        .padding()
    }
}

struct MenuView: View {
    var body: some View {
        HStack {
            VStack {
                Image(systemName: "xmark")
                    .font(Font.title.weight(.black))
                
            }
            .frame(width: 44, height: 44)
            .background(Color.white)
            .foregroundColor(.red)
            .cornerRadius(22)
            .shadow(color: .gray, radius: 20, x: 0, y: 10)
            
            Spacer()
            
            VStack {
                Image(systemName: "heart.fill")
                    .font(Font.title.weight(.thin))
                    .offset(y: 2)
                
            }
            .frame(width: 44, height: 44)
            .background(Color.white)
            .foregroundColor(.green)
            .cornerRadius(22)
            .shadow(color: .gray, radius: 20, x: 0, y: 10)
        }
        .frame(maxWidth: 150)
    }
}

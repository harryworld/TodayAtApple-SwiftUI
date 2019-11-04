//
//  TinderView.swift
//  TodayAtApple-SwiftUI
//
//  Created by Harry Ng on 3/11/2019.
//  Copyright © 2019 StaySorted Inc. All rights reserved.
//

import SwiftUI

struct TinderView: View {
    @State var offset = CGSize.zero
    
    var body: some View {
        let drag = DragGesture()
            .onChanged { self.offset = $0.translation }
            .onEnded {
                if $0.translation.width < -100 {
                    self.offset = .init(width: -1000, height: 0)
                } else if $0.translation.width > 100 {
                    self.offset = .init(width: 1000, height: 0)
                } else {
                    self.offset = .zero
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    self.offset = .zero
                }
        }
        
        return ZStack {
            BlurView(style: .systemMaterial)
            
            VStack(spacing: 0) {
                ZStack {
                    CardView(image: "mango_sticky_rice", food: "Mango Sticky Rice", restaurant: "Central Plaza Airport")
                    
                    CardView()
                        .rotationEffect(Angle(degrees: Double(offset.width / 10)))
                        .offset(x: offset.width, y: offset.height)
                        .gesture(drag)
                        .animation(.spring())
                }
                
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

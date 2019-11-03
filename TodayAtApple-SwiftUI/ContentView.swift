//
//  ContentView.swift
//  TodayAtApple-SwiftUI
//
//  Created by Harry Ng on 3/11/2019.
//  Copyright © 2019 StaySorted Inc. All rights reserved.
//

import SwiftUI

struct ContentView : View {
    @State private var offset: CGSize = .zero
    
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
        }
        
        return ZStack {
            PersonView()
                .background(Color.red)
                .cornerRadius(8)
                .shadow(radius: 8)
                .padding()
//                .offset(x: offset.width, y: offset.height)
//                .gesture(drag)
                .animation(.spring())
            
            PersonView()
                .background(Color.red)
                .cornerRadius(8)
                .shadow(radius: 8)
                .padding()
                .offset(x: offset.width, y: offset.height)
                .gesture(drag)
                .animation(.spring())
        }
    }
}

struct PersonView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Rectangle()
                .fill(Color.gray)
                .cornerRadius(8)
                .frame(height: 300)
            
            Text("Majid Jabrayilov")
                .font(.title)
                .foregroundColor(.white)
            
            Text("iOS Developer")
                .font(.body)
                .foregroundColor(.white)
        }.padding()
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//
//  MenuView.swift
//  TodayAtApple-SwiftUI
//
//  Created by Harry Ng on 4/11/2019.
//  Copyright © 2019 StaySorted Inc. All rights reserved.
//

import SwiftUI

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

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}

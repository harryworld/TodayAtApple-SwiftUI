//
//  FoodStore.swift
//  TodayAtApple-SwiftUI
//
//  Created by Harry Ng on 4/11/2019.
//  Copyright © 2019 StaySorted Inc. All rights reserved.
//

import SwiftUI

struct Food: Identifiable {
    let id = UUID()
    var image: String
    var name: String
    var restaurant: String
}

final class FoodStore: ObservableObject {
    @Published var foods: [Food] = []
    
    func fetch() {
        foods = [
            Food(image: "fruit_bowl", name: "Fruit Bowl", restaurant: "Pun Pun Market"),
            Food(image: "papaya_salad", name: "Som Tum", restaurant: "Pun Pun Market"),
            Food(image: "pencake", name: "Pencake", restaurant: "Pun Pun Market"),
            Food(image: "mango_sticky_rice", name: "Mango Sticky Rice", restaurant: "Central Plaza Airport"),
            Food(image: "pineapple_rice", name: "Pineapple Fried Rice", restaurant: "Cooking Love"),
            Food(image: "thai_sausage", name: "Northern Thai Sausage", restaurant: "Saturday Night Market"),
            ].shuffled()
    }
}

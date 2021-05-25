//
//  ContentView.swift
//  RatingView-Master
//
//  Created by Esben Viskum on 25/05/2021.
//

import SwiftUI
import RatingView

struct ContentView: View {
    @State private var currentRating = 0
    
    var body: some View {
        VStack {
            RatingView(maxRating: 5, currentRating: $currentRating)
            Text("My Ratings")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//
//  RatingView.swift
//  RatingView-Master
//
//  Created by Esben Viskum on 25/05/2021.
//

import SwiftUI

public struct RatingView: View {
    @Binding var currentRating: Int

    var maxRating: Int
    var width:Int
    var color: UIColor
    var ratingImage: RatingImage
    
    public init(maxRating: Int, currentRating: Binding<Int>, width: Int = 20, color: UIColor = .systemYellow, ratingImage: RatingImage = .star) {
        self.maxRating = maxRating
        self._currentRating = currentRating
        self.width = width
        self.color = color
        self.ratingImage = ratingImage
    }

    func correctImage(for rating: Int) -> Image {
        if rating < currentRating {
            return ratingImage.fillImage
        } else {
            return ratingImage.openImage
        }
    }
    
    public var body: some View {
        HStack {
            ForEach(0..<maxRating) { rating in
                correctImage(for: rating)
                    .resizable()
                    .scaledToFit()
                    .foregroundColor(Color(color))
                    .onTapGesture {
                        self.currentRating = rating+1
                    }
            }
        }.frame(width: CGFloat(maxRating * width))
    }
}

struct RatingView_Previews: PreviewProvider {
    static var previews: some View {
        RatingView(maxRating: 5, currentRating: .constant(3))
            .environment(\.colorScheme, .light)
            .previewLayout(.sizeThatFits)
            .padding(10)
    }
}

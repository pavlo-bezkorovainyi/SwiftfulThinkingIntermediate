//
//  MaskBootcamp.swift
//  SwiftfulThinkingIntermediate
//
//  Created by Павел Бескоровайный on 06.07.2023.
//

import SwiftUI

struct MaskBootcamp: View {
  
  @State var rating: Int = 0
  
  var body: some View {
    ZStack {
      starsView
        .overlay(overlayView.mask(starsView))
    }
  }
  
  private var starsView: some View {
    HStack {
      ForEach(1..<6) { index in
        Image(systemName: "star.fill")
          .foregroundColor(.gray)
          .font(.largeTitle)
          .onTapGesture {
            withAnimation(.easeInOut) {
              rating = index
            }
            
          }
      }
    }
  }
  
  private var overlayView: some View {
    GeometryReader { geometry in
      ZStack(alignment: .leading) {
        Rectangle()
//          .foregroundColor(.yellow)
          .fill(LinearGradient(colors: [.orange, .yellow], startPoint: .leading, endPoint: .trailing))
          .frame(width: geometry.size.width / 5 * CGFloat(rating))
        //            .mask(starsView)
      }
    }
    .allowsHitTesting(false) //MARK: !!!
  }
}

struct MaskBootcamp_Previews: PreviewProvider {
  static var previews: some View {
    MaskBootcamp()
  }
}

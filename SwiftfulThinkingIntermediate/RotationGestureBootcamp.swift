//
//  RotationGestureBootcamp.swift
//  SwiftfulThinkingIntermediate
//
//  Created by Павел Бескоровайный on 18.06.2023.
//

import SwiftUI

struct RotationGestureBootcamp: View {
  
  @State var angle: Angle = .zero
  
  var body: some View {
    Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
      .font(.largeTitle)
      .fontWeight(.semibold)
      .foregroundColor(.white)
      .padding(50)
      .background(Color.blue.cornerRadius(10))
      .rotationEffect(angle)
//      .rotation3DEffect(angle, axis: (x: 100, y: 100, z: 100))
      .gesture(
        RotationGesture()
          .onChanged { value in
            angle = value
          }
          .onEnded { value in
            withAnimation(.spring()) {
              angle = Angle(degrees: 0)
            }
          }
      )
    
  }
}

struct RotationGestureBootcamp_Previews: PreviewProvider {
  static var previews: some View {
    RotationGestureBootcamp()
  }
}

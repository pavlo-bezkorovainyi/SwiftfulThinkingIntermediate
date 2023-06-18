//
//  DragGestureBootcamp.swift
//  SwiftfulThinkingIntermediate
//
//  Created by Павел Бескоровайный on 18.06.2023.
//

import SwiftUI

struct DragGestureBootcamp: View {
  
  @State var offset: CGSize = .zero
  
  var body: some View {
    ZStack {
      
      VStack {
        Text("WIDTH: \(offset.width)")
        Spacer()
      }
      RoundedRectangle(cornerRadius: 20)
        .frame(width: 300, height: 500)
        .offset(offset)
        .scaleEffect(getScaleAmount())
        .rotationEffect(Angle(degrees: getRotationAmount()))
        .gesture(
          DragGesture()
            .onChanged { value in
              withAnimation(.spring()) {
                offset = value.translation
              }
            }
            .onEnded { value in
              withAnimation(.spring()) {
                offset = .zero
              }
            }
        )
    }
  }
  
  func getScaleAmount() -> CGFloat {
    let max = UIScreen.main.bounds.width / 2
    let currentAmount = abs(offset.width)
    let percentage = currentAmount / max
    return 1.0 - min(percentage, 0.5) * 0.5
  }
  
  func getRotationAmount() -> Double {
    let max = UIScreen.main.bounds.width / 2
    let currentAmount = offset.width
    let percentage = Double(currentAmount / max)
    let maxAngle: Double = 10
    return percentage * maxAngle
  }
}

struct DragGestureBootcamp_Previews: PreviewProvider {
  static var previews: some View {
    DragGestureBootcamp()
  }
}

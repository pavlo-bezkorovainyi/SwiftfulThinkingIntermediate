//
//  DragGestureBootcamp2.swift
//  SwiftfulThinkingIntermediate
//
//  Created by Павел Бескоровайный on 18.06.2023.
//

import SwiftUI

struct DragGestureBootcamp2: View {
  
  @State var startingOffsetY: CGFloat = UIScreen.main.bounds.height * 0.85
  @State var currentDragOffsetY: CGFloat = 0
  @State var endingOffSetY: CGFloat = 0
  
  
  var body: some View {
    ZStack {
      Color.green.ignoresSafeArea()
      
      MySignUpView()
        .offset(y: startingOffsetY)
        .offset(y: currentDragOffsetY)
        .offset(y: endingOffSetY)
        .gesture(
          DragGesture()
            .onChanged { value in
              withAnimation(.spring()) {
                currentDragOffsetY = value.translation.height
              }
            }
            .onEnded { value in
              withAnimation(.spring()) {
                if currentDragOffsetY < -150 {
                  endingOffSetY = -startingOffsetY
                } else if endingOffSetY != 0 && currentDragOffsetY > 150 {
                  endingOffSetY = 0
                }
                currentDragOffsetY = 0
              }
            }
        )
    }
  }
}

struct DragGestureBootcamp2_Previews: PreviewProvider {
  static var previews: some View {
    DragGestureBootcamp2()
  }
}

struct MySignUpView: View {
  var body: some View {
    VStack(spacing: 20) {
      Image(systemName: "chevron.up")
        .padding(.top)
      Text("Sign up")
        .font(.headline)
        .fontWeight(.semibold)
      
      Image(systemName: "flame.fill")
        .resizable()
        .scaledToFit()
        .frame(width: 100, height: 100)
      
      Text("This is description for our app. This is my favorite SwftUI course and I recommend to all of my friends to subscribe to Swiftful Thinking")
        .multilineTextAlignment(.center)
      
      Text("CREATE AN ACCOUNT")
        .foregroundColor(.white)
        .font(.headline)
        .padding()
        .padding(.horizontal)
        .background(Color.black.cornerRadius(10))
      
      Spacer()
    }
    .frame(maxWidth: .infinity)
    .background(Color.white)
    .cornerRadius(30)
    .ignoresSafeArea(edges: .bottom)
  }
}

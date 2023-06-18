//
//  LongPressGestureBootcamp.swift
//  SwiftfulThinkingIntermediate
//
//  Created by Павел Бескоровайный on 18.06.2023.
//

import SwiftUI

struct LongPressGestureBootcamp: View {
  
  @State var isComplete: Bool = false
  @State var isSuccess: Bool = false
  
  var body: some View {
    VStack {
      Rectangle()
        .fill(isSuccess ? Color.green : Color.blue)
        .frame(maxWidth: isComplete ? .infinity : 0)
        .frame(height: 55)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color.gray)
      
      
      HStack {
        Text("Click Here".uppercased())
          .foregroundColor(.white)
          .padding()
          .background(Color.black)
          .cornerRadius(10)
          .onLongPressGesture(minimumDuration: 1.0, maximumDistance: 50) {
            withAnimation(.easeInOut) {
              isSuccess = true
            }
          } onPressingChanged: { isPressing in
            //start of press to the min duration
            if isPressing {
              withAnimation(.easeOut(duration: 1)) {
                isComplete = true
              }
            } else {
              DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                if !isSuccess {
                  withAnimation(.easeInOut) {
                    isComplete = false
                  }
                }
              }
            }
          }

        
        Text("Reset".uppercased())
          .foregroundColor(.white)
          .padding()
          .background(Color.black)
          .cornerRadius(10)
          .onTapGesture {
            withAnimation(.easeIn) {
              isComplete = false
              isSuccess = false
            }
          }
      }
    }
    
    
    //      Text(isComplete ? "COMPLETED" : "NOT COMPELTE")
    //        .padding()
    //        .padding(.horizontal)
    //        .background(isComplete ? Color.green : Color.gray)
    //        .cornerRadius(10)
    ////        .onTapGesture {
    ////          isComplete.toggle()
    ////        }
    //        .onLongPressGesture(minimumDuration: 3, maximumDistance: 50) {
    //          isComplete.toggle()
    //        }
  }
}

struct LongPressGestureBootcamp_Previews: PreviewProvider {
  static var previews: some View {
    LongPressGestureBootcamp()
  }
}

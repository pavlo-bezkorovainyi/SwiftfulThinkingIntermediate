//
//  ScrollViewReaderBootcamp.swift
//  SwiftfulThinkingIntermediate
//
//  Created by Павел Бескоровайный on 19.06.2023.
//

import SwiftUI

struct ScrollViewReaderBootcamp: View {
  
  @State var scrollToIndex: Int = 0
  @State var textFieldText: String = ""
  
  var body: some View {
    VStack {
      TextField("Enter a # here", text: $textFieldText)
        .padding()
        .frame(height: 55)
        .border(Color.gray)
        .padding(.horizontal)
        .keyboardType(.numberPad)
      
      Button("SCROLL NOW") {
        withAnimation(.spring()) {
          if let index = Int(textFieldText) {
            scrollToIndex = index
          }
          
        }
      }
      
      ScrollView {
        ScrollViewReader { proxy in
          ForEach(0..<50) { index in
            Text("This is item #\(index)")
              .font(.headline)
              .frame(height: 200)
              .frame(maxWidth: .infinity)
              .background(Color.white)
              .cornerRadius(10)
              .shadow(radius: 10)
              .padding()
              .id(index) //GIVE ID TO ITEM
          }
          .onChange(of: scrollToIndex) { newValue in
            withAnimation(.spring()) {
              proxy.scrollTo(newValue, anchor: .center) //ANCHOR FOR PLACEMENT
            }
          }
        }
      }
    }
  }
}

struct ScrollViewReaderBootcamp_Previews: PreviewProvider {
  static var previews: some View {
    ScrollViewReaderBootcamp()
  }
}

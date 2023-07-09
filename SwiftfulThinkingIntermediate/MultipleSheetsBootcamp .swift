//
//  MultipleSheetsBootcamp .swift
//  SwiftfulThinkingIntermediate
//
//  Created by Павел Бескоровайный on 06.07.2023.
//

import SwiftUI

struct RandomModel: Identifiable {
  let id = UUID().uuidString
  let title: String
}

// 1 - use a binding
// 2 - use multiple .sheets
// 3 - use $item

struct MultipleSheetsBootcamp_: View {
  
  @State var selectedModel: RandomModel?
  @State var showSheet: Bool = false
  @State var showSheet2: Bool = false
  
  var body: some View {
    VStack(spacing: 20) {
      
      ForEach(0..<50) { id in
        
      }
      Button("Button 1") {
        
      }
// #2      .sheet(isPresented: $showSheet) {
//        NextScreen(selectedModel: RandomModel(title: "ONE"))
//      }
      Button("Button 2") {
        
      }
// #2      .sheet(isPresented: $showSheet2) {
//        NextScreen(selectedModel: RandomModel(title: "TWO"))
//      }
    }
    .sheet(item: $selectedModel) { model in
      NextScreen(selectedModel: selectedModel)
    }
//    .sheet(isPresented: $showSheet) {
//      NextScreen(selectedModel: selectedModel)
//    }
  }
}

struct NextScreen: View {
 // #1 @Binding var selectedModel: RandomModel
  let selectedModel: RandomModel?
  
  var body: some View {
    Text(selectedModel?.title ?? "Test")
      .font(.largeTitle)
  }
}

struct MultipleSheetsBootcamp__Previews: PreviewProvider {
  static var previews: some View {
    MultipleSheetsBootcamp_()
  }
}

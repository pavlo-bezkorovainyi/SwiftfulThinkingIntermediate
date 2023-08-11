//
//  TimerBootcamp.swift
//  SwiftfulThinkingIntermediate
//
//  Created by Павел Бескоровайный on 11.08.2023.
//

import SwiftUI
import Combine

struct TimerBootcamp: View {
  
  let timer = Timer.publish(every: 3, on: .main, in: .common).autoconnect()
  
  //Current Time:
  /*
   @State var currentDate: Date = Date()
   var dateFormatter: DateFormatter {
   let formatter = DateFormatter()
   //    formatter.dateStyle = .medium
   formatter.timeStyle = .medium
   return formatter
   }
   */
  
  //Countdown
  /*
   @State var count: Int = 10
   @State var finishedText: String? = nil
   */
  
  //Countdown to date
  /*
  @State var timeRemaining: String = ""
  let futuredDate: Date = Calendar.current.date(byAdding: .hour, value: 1, to: Date()) ?? Date()
  
  func updateTimeRemaining() {
    let remaining = Calendar.current.dateComponents([.minute, .second], from: Date(), to: futuredDate)
    let hour = remaining.hour ?? 0
    let minute = remaining.minute ?? 0
    let second = remaining.second ?? 0
    timeRemaining = "\(minute) minutes, \(second) seconds"
     
  }
   */
  
  // Animation counter
  @State var count: Int = 1
  
  var body: some View {
    ZStack {
      RadialGradient(
        colors: [.blue, .black],
        center: .center,
        startRadius: 5,
        endRadius: 500)
      .ignoresSafeArea()
      
      TabView(selection: $count) {
        Rectangle()
          .foregroundColor(.red)
          .tag(1)
        Rectangle()
          .foregroundColor(.blue)
          .tag(2)
        Rectangle()
          .foregroundColor(.green)
          .tag(3)
        Rectangle()
          .foregroundColor(.orange)
          .tag(4)
        Rectangle()
          .foregroundColor(.pink)
          .tag(5)
      }
      .tabViewStyle(.page)
      .frame(height: 200)
    }
    .onReceive(timer) { _ in
      withAnimation(.default) {
        count = count == 5 ? 1 : count + 1
      }
    

    }
  }
}

struct TimerBootcamp_Previews: PreviewProvider {
  static var previews: some View {
    TimerBootcamp()
  }
}

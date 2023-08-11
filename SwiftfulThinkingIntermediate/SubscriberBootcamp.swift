//
//  SubscriberBootcamp.swift
//  SwiftfulThinkingIntermediate
//
//  Created by Павел Бескоровайный on 11.08.2023.
//

import SwiftUI
import Combine

class SubscriberViewModel: ObservableObject {
  
  @Published var count: Int = 0
  //  var timer: AnyCancellable?
  var cancellables = Set<AnyCancellable>()
  
  @Published var textFieldText: String = ""
  @Published var textIsValid: Bool = false
  
  @Published var showButton: Bool = false
  
  init() {
    setUpTimer()
    addTextFieldSubscriber()
    addButtonSubscriber()
  }
  
  func addTextFieldSubscriber() {
    $textFieldText
      .debounce(for: .seconds(0.5), scheduler: DispatchQueue.main) //ИНТЕРВАЛЬНОСТЬ ПРОВЕРКИ
      .map { $0.count > 3 }
      .sink(receiveValue: { [weak self] (isValid) in
        self?.textIsValid = isValid
        
      })
      .store(in: &cancellables)
  }
  
  func setUpTimer() {
    //    timer =
    Timer
      .publish(every: 1, on: .main, in: .common)
      .autoconnect()
      .sink { [weak self] _ in
        guard let self = self else { return }
        self.count += 1
      }
      .store(in: &cancellables) //STORE или TIMER =
  }
  
  func addButtonSubscriber() {
    $textIsValid
      .combineLatest($count)
      .sink { [weak self] (isValid, count) in
        guard let self = self else { return }
        self.showButton = isValid && count >= 10
      }
      .store(in: &cancellables)
  }
  
}

struct SubscriberBootcamp: View {
  
  @StateObject var vm = SubscriberViewModel()
  
  var body: some View {
    VStack {
      Text("\(vm.count)")
        .font(.largeTitle)
      
      Text(vm.textIsValid.description)
      
      TextField("Type somethins here...", text: $vm.textFieldText)
        .padding(.leading)
        .frame(height: 55)
        .font(.headline)
        .background(Color(textFieldColorMercury))
        .cornerRadius(10)
        .overlay(
          ZStack {
            Image(systemName: "xmark")
              .foregroundColor(.red)
              .opacity(
                vm.textFieldText.count < 1 ? 0 :
                vm.textIsValid ? 0 : 1.0)
            
            Image(systemName: "checkmark")
              .foregroundColor(.green)
              .opacity(vm.textIsValid ? 1.0 : 0.0)
          }
            .font(.headline)
            .padding(.trailing)
          
          , alignment: .trailing)
      
      Button {
        
      } label: {
        Text("Submit".uppercased())
          .font(.headline)
          .foregroundColor(.white)
          .frame(height: 55)
          .frame(maxWidth: .infinity)
          .background(Color.blue)
          .cornerRadius(10)
          .opacity(vm.showButton ? 1.0 : 0.5)
      }
      .disabled(!vm.showButton)

      
    }
    .padding()
    
  }
}

struct SubscriberBootcamp_Previews: PreviewProvider {
  static var previews: some View {
    SubscriberBootcamp()
  }
}

let textFieldColorMercury = #colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 1)


//
//  CodableBootcamp.swift
//  SwiftfulThinkingIntermediate
//
//  Created by Павел Бескоровайный on 10.08.2023.
//

import SwiftUI

// Codable = Decodable + Encodable

struct CustomerModel: Identifiable, Codable {
  let id: String
  let name: String
  let points: Int
  let isPremium: Bool
  
//  enum CodingKeys: String, CodingKey {
//    case id
//    case name
//    case points
//    case isPremium
//  }
  
//  init(id: String, name: String, points: Int, isPremium: Bool) {
//    self.id = id
//    self.name = name
//    self.points = points
//    self.isPremium = isPremium
//  }
  
//  init(from decoder: Decoder) throws {
//    let container = try decoder.container(keyedBy: CodingKeys.self)
//    self.id = try container.decode(String.self, forKey: .id)
//    self.name = try container.decode(String.self, forKey: .name)
//    self.points = try container.decode(Int.self, forKey: .points)
//    self.isPremium = try container.decode(Bool.self, forKey: .isPremium)
//  }
//
//  func encode(to encoder: Encoder) throws {
//    var container = encoder.container(keyedBy: CodingKeys.self)
//    try container.encode(self.id, forKey: .id)
//    try container.encode(self.name, forKey: .name)
//    try container.encode(self.points, forKey: .points)
//    try container.encode(self.isPremium, forKey: .isPremium)
//  }
}

class CodableViewModel: ObservableObject {
  
  @Published var customer: CustomerModel? = nil
  
  init() {
    getData()
  }
  
  func getData() {
    guard let data = getJSONData() else { return }
    self.customer = try? JSONDecoder().decode(CustomerModel.self, from: data)
    
  }
}

func getJSONData() -> Data? {
  
  let customer = CustomerModel(id: "111", name: "Emily", points: 100, isPremium: false)
  let jsonData = try? JSONEncoder().encode(customer)
//  let dictionary: [String: Any] = [
//    "id" : "12345",
//    "name" : "Joe",
//    "points" : 5,
//    "isPremium" : true
//  ]
  
//  let jsonData = try? JSONSerialization.data(withJSONObject: dictionary)
  return jsonData
}

struct CodableBootcamp: View {
  
  @StateObject var vm = CodableViewModel()
  
  var body: some View {
    VStack(spacing: 20) {
      if let customer = vm.customer {
        Text(customer.id)
        Text(customer.name)
        Text("\(customer.points)")
        Text(customer.isPremium.description)
      }
    }
  }
}

struct CodableBootcamp_Previews: PreviewProvider {
  static var previews: some View {
    CodableBootcamp()
  }
}

//
//  TypeAliasBootcamp.swift
//  SwiftfulThinkingIntermediate
//
//  Created by Павел Бескоровайный on 10.08.2023.
//

import SwiftUI

struct MovieModel {
  let title: String
  let director: String
  let count: Int
}

typealias TVModel = MovieModel

struct TypeAliasBootcamp: View {
  
//  @State var item: MovieModel = MovieModel(title: "Title", director: "Joe", count: 5)
  @State var item = TVModel(title: "TV Title", director: "Emmily", count: 10)
  
  var body: some View {
    VStack {
      Text(item.title)
      Text(item.director)
      Text("\(item.count)")
    }
 
  }
}

struct TypeAliasBootcamp_Previews: PreviewProvider {
  static var previews: some View {
    TypeAliasBootcamp()
  }
}

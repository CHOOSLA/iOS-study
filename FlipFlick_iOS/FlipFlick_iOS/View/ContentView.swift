//
//  ContentView.swift
//  FlipFlick_iOS
//
//  Created by choosla on 8/27/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
      NavigationStack{
        ScrollView {
          VStack{
            MovieCard()
            MovieCard()
          }
//          .toolbar {
//            ToolbarItem(placement: .principal) {
//              HStack {
//                Image("logo_full")
//                  .resizable()
//                  .aspectRatio(contentMode: .fit)
//              }.padding(.bottom, 10)
//            }
//          }
          .navigationTitle("볼래말래")
        }
      }
    }
}

struct MovieCard: View{
  var body: some View {
    Text("Hello, World!")
  }
}

#Preview {
    ContentView()
}

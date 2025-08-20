//
//  ContentView4.swift
//  8StateManagement
//
//  Created by choosla on 8/19/25.
//

import SwiftUI

class Countermodel: ObservableObject {
  @Published var count: Int = 0
}

struct ContentView4: View {
  @StateObject var counter = Countermodel()
    var body: some View {
      VStack{
        Text("카운트: \(counter.count)")
        Button("증가"){
          counter.count += 1
        }
      }
        
    }
}



#Preview {
    ContentView4()
}

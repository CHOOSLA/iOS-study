//
//  ContentView.swift
//  8StateManagement
//
//  Created by choosla on 8/19/25.
//

import SwiftUI

struct ContentView: View {
  @State private var count = 0
    var body: some View {
        VStack {
            Text("Count: \(count)")
        }
        .padding()
      
      Button("증가"){
        count += 1
      }
    }
}

#Preview {
    ContentView()
}

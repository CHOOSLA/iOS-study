//
//  ContentView.swift
//  7SafeArea
//
//  Created by choosla on 8/19/25.
//

import SwiftUI

struct ContentView: View {
  var body: some View {
    VStack {
      Text("Hello, world!")
        .font(.largeTitle)
        .frame(maxWidth: .infinity)
        .background(Color.red)
      Spacer()
      Text("Hello, world!")
        .font(.title)
    }
    .ignoresSafeArea(edges : .top) // Safe Area 무시
  }
}

#Preview {
    ContentView()
}

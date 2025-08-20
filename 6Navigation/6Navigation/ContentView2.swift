//
//  ContentView2.swift
//  6Navigation
//
//  Created by choosla on 8/19/25.
//

import SwiftUI

struct ContentView2: View {
  @State private var path = NavigationPath()
    var body: some View {
      NavigationStack(path: $path){
        List {
          Button("화면 A로 이동") { path.append("A") }
          Button("화면 B로 이동") { path.append("B") }
          
        }
        .navigationDestination(for: String.self) { value in
          if(value == "A"){
            Text("화면 A")
          } else {
            Text("화면 B")
          }
        }.navigationTitle("홈")
          .navigationBarTitleDisplayMode(.inline)
          .toolbar{
              ToolbarItem( placement: .navigationBarTrailing) {
                Button("Edit"){
                  print("에디트버튼 눌림")
              }
            }
          }
      }
    }
}

#Preview {
    ContentView2()
}

//
//  ContentView6.swift
//  8StateManagement
//
//  Created by choosla on 8/19/25.
//

import SwiftUI

class UserSettings: ObservableObject {
  @Published var username: String = "Guest"
}

struct ContentView6: View {
  @EnvironmentObject var settings : UserSettings
  var body: some View {
    Text("사용자: \(settings.username)")
    
    Button("Username 변경"){
      settings.username = "ChooChoo"
    }
  }
  
  
}

#Preview {
  ContentView6()
    .environmentObject(UserSettings())
}

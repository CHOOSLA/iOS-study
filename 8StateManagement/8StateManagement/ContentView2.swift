//
//  ContentView2.swift
//  8StateManagement
//
//  Created by choosla on 8/19/25.
//

import SwiftUI

struct ContentView2: View {
  @State private var isOn = false
  @State private var input: String = ""
  var body: some View {
    ToggleView(isOn: $isOn)
    Text(isOn ? "ON" : "OFF")
    // $를 붙이게 된다면 변수의 주소에 접근하게 된다는 뜻
    TextField("asdf", text: $input)
  }
}

// Binding 이라는 것은 즉, emit을 사용한다는 뜻
struct ToggleView: View {
  @Binding var isOn : Bool
  var body: some View {
    Toggle("스위치", isOn: $isOn)
      .frame(width: 150)
  }
}

#Preview {
  ContentView2()
}

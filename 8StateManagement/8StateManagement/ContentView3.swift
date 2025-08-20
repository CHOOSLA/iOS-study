//
//  ContentView3.swift
//  8StateManagement
//
//  Created by choosla on 8/19/25.
//

import SwiftUI

// kotlin의 data class = swift의 struct


// 값 타입
struct TestStruct{
  var value = 0;
}

// 참조 타입
class TestClass{
  var value = 0;
}

struct ContentView3: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    ContentView3()
}

//
//  ContentView2.swift
//  1Text&Stack
//
//  Created by Admin on 8/18/25.
//

import SwiftUI
struct ContentView2: View {
    var body: some View {
        ZStack{
            Text("Hello, World!1")
            Text("Hello, World!2")
            Text("Hello, World!3")
            Text("Hello, World!4")
            // 이것을 통해 위에다가 계속 쌓아진다는 것을 알 수 있음
            Text("Hello, World!5").background(.blue)
        }
       
    }
}

#Preview {
    ContentView2()
}

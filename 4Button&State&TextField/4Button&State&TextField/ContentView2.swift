//
//  ContentView2.swift
//  4Button&State&TextField
//
//  Created by Admin on 8/18/25.
//

import SwiftUI

struct ContentView2: View {
    @State private var message: String = ""
    var body: some View {
        VStack{
            Text(message)
                .padding(.bottom, 30)
            Button{
                message = "반갑습니다"
            } label: {
                HStack{
                    Image(systemName: "star.fill")
                    Text("버튼")
                }
            }.buttonStyle(.borderedProminent)
        }
    }
}

#Preview {
    ContentView2()
}

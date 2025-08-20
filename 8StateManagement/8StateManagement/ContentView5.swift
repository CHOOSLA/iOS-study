//
//  ContentView5.swift
//  8StateManagement
//
//  Created by choosla on 8/19/25.
//

import SwiftUI

class CounterModel2 : ObservableObject {
  @Published var count = 0
}

struct ChildView1: View {
  @ObservedObject var counterModel : CounterModel2
  
    var body: some View {
      Button("증가"){
        counterModel.count += 1
      }.background(Color.red).font(.largeTitle)
    }
}

struct ChildView2: View {
  @ObservedObject var counterModel : CounterModel2
  
  var body: some View {
    Button("증가"){
      counterModel.count += 1
    }.background(Color.yellow).font(.largeTitle)
  }
}

struct ContentView5: View {
  @StateObject var counterModel = CounterModel2()
  var body: some View {
    VStack{
      Text("카운트 : \(counterModel.count)")
      ChildView1(counterModel: counterModel)
      ChildView2(counterModel: counterModel)
    }
    
  }
}

#Preview {
    ContentView5()
}

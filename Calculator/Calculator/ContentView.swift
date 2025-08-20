//
//  ContentView.swift
//  Calculator
//
//  Created by choosla on 8/20/25.
//

import SwiftUI

struct ContentView: View {
  @State var display: String = "300"
  @State var inputA: String = ""
  @State var inputB: String = ""
  
  // 버튼 레이블 배열
  let labels: Array<String> = [
    "7", "8", "9", "/",
    "4", "5", "6", "*",
    "1", "2", "3", "-",
    "0", ".", "=", "+"
  ]
  
  var body: some View {
    VStack {
      Text(display)
        .padding()
        .background(Color.gray.opacity(0.2))
      
      // columns 매개변수는
      // CSS의 GridTemplates 와 비슷한 방식
      // 그리드의 구조를 먼저 명시
      // 여기서 Array의 특수 기능인 repeating과 count를 사용해서 반복해버림
      // 그러면 한 Row에 대한 서식이 완성됨
      LazyVGrid(columns: Array(repeating: GridItem(.flexible(minimum: 50)), count: 4)) {
        ForEach(labels, id: \.self){ label in
          Button(label){}.buttonStyle(.borderedProminent)
        }
      }
      
      TextField("Input A", text: $inputA)
        .textFieldStyle(.roundedBorder)
        .padding()
      TextField("Input A", text: $inputB)
        .textFieldStyle(.roundedBorder)
        .padding()
      
      HStack{
        Button("+"){
          let a = Int(inputA)!
          let b = Int(inputB)!
          display = "\(a + b)"
        }.buttonStyle(.borderedProminent)
        Button("-"){
          let a = Int(inputA)!
          let b = Int(inputB)!
          display = "\(a - b)"
        }.buttonStyle(.borderedProminent)
        Button("*"){
          let a = Int(inputA)!
          let b = Int(inputB)!
          display = "\(a * b)"
        }.buttonStyle(.borderedProminent)
        Button("/"){
          let a = Int(inputA)!
          let b = Int(inputB)!
          display = "\(a / b)"
        }.buttonStyle(.borderedProminent)
      }
    }
    .padding()
  }
}

#Preview {
  ContentView()
}

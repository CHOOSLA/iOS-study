//
//  ContentView4.swift
//  5ForEach&LazyVStack
//
//  Created by choosla on 8/19/25.
//

import SwiftUI

struct Fruit3: Identifiable{
    let id = UUID()
    
    let name : String
    let imageName : String
}

struct ContentView4: View {
    var body: some View {
//      ScrollView(showsIndicators: false) {
//        VStack(spacing: 16){
//          ForEach(0..<100){ index in
//            Text("텍스트 \(index)")
//          }
//        }
//        .frame(maxWidth: .infinity)
//        .background(Color.gray)
//      }
      
        // 가로 스크롤
//      ScrollView(.horizontal ,showsIndicators: false) {
//        HStack(spacing: 16){
//          ForEach(0..<100){ index in
//            Text("텍스트 \(index)")
//          }
//        }
//        .frame(maxHeight: .infinity)
//        .background(Color.gray)
//      }
      
      let fruits = [
          Fruit3(name: "사과", imageName: "applelogo"),
          Fruit3(name: "바나나", imageName: "leaf"),
          Fruit3(name: "오렌지", imageName: "sun.max.fill"),
          Fruit3(name: "사과", imageName: "applelogo"),
          Fruit3(name: "바나나", imageName: "leaf"),
          Fruit3(name: "오렌지", imageName: "sun.max.fill"),
          Fruit3(name: "사과", imageName: "applelogo"),
          Fruit3(name: "바나나", imageName: "leaf"),
          Fruit3(name: "오렌지", imageName: "sun.max.fill"),
          Fruit3(name: "사과", imageName: "applelogo"),
          Fruit3(name: "바나나", imageName: "leaf"),
          Fruit3(name: "오렌지", imageName: "sun.max.fill"),
          Fruit3(name: "사과", imageName: "applelogo"),
          Fruit3(name: "바나나", imageName: "leaf"),
          Fruit3(name: "오렌지", imageName: "sun.max.fill"),
          Fruit3(name: "사과", imageName: "applelogo"),
          Fruit3(name: "바나나", imageName: "leaf"),
          Fruit3(name: "오렌지", imageName: "sun.max.fill"),
          Fruit3(name: "사과", imageName: "applelogo"),
          Fruit3(name: "바나나", imageName: "leaf"),
          Fruit3(name: "오렌지", imageName: "sun.max.fill"),
          Fruit3(name: "사과", imageName: "applelogo"),
          Fruit3(name: "바나나", imageName: "leaf"),
          Fruit3(name: "오렌지", imageName: "sun.max.fill"),
          Fruit3(name: "사과", imageName: "applelogo"),
          Fruit3(name: "바나나", imageName: "leaf"),
          Fruit3(name: "오렌지", imageName: "sun.max.fill"),
          
      ]
      
      ScrollView(showsIndicators : false){ // LazyVStack, LazyHStack, LazyZStack
        // Lazy"X"Stack : 동적으로 아이템 노출(메모리 관리 우수
        LazyVStack(spacing: 16){
          ForEach(fruits){ fruit in
            CardView(fruit : fruit)
          }
        }
      }
    }
}

struct CardView: View {
  let fruit: Fruit3
  var body: some View {
    HStack {
      Image(systemName : fruit.imageName)
      Text(fruit.name)
    }
    .frame(maxWidth: .infinity, minHeight: 100 , maxHeight: 100)
    .background(Color.yellow)
    .cornerRadius(16)
    .padding(.horizontal, 16)
  }
}

#Preview {
    ContentView4()
}

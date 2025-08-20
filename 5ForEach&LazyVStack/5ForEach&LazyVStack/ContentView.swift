//
//  ContentView.swift
//  5ForEach&LazyVStack
//
//  Created by choosla on 8/19/25.
//

import SwiftUI

struct Fruit: Identifiable{
    let id = UUID()
    
    let name : String
    let imageName : String
}

struct ContentView: View {
//    let fruits = ["사과", "바나나","오렌지"]
    let fruits = [
        Fruit(name: "사과", imageName: "applelogo"),
        Fruit(name: "바나나", imageName: "leaf"),
        Fruit(name: "오렌지", imageName: "sun.max.fill")
    ]
    var body: some View {
        VStack(alignment : .leading) {
            // 1. 범위 연산로
            // ForEach는 자기 자신이 아이템을 배치하는 능력이 없기 때문에 VStack 등과
            // 같은 컨테이너와 함께 사용해야 한다.
            ForEach(1...5, id: \.self){ index in
                Text("\(index)")
            }
            
            // 2. 문자열 배열로
//            ForEach(fruits, id: \.self){ fruit in
//                Text(fruit)
//            }
            
            // 3. 모델 데이터 배열로
            ForEach(fruits){ fruit in
                HStack{
                    Image(systemName: fruit.imageName)
                    Text(fruit.name)
                }
            }
            
        }
    }
}

#Preview {
    ContentView()
}
